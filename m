Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660649;
	b=Ig2uQCUthN7MQPW6r+3KAmL0sn9jBWvhHt9+ech/dRLIxEH6c7j8yEGbQ4TS4aEN9pnd
	 oKwbuLyHHFXkrKYLE/fK7OZW3gJ1eswPW/xL06J9rUqkSHJM2dEaXJG5wsY1IMJMOdBwh
	 YV/AYOCs1dKBMMLHhmoYfv83vT87mceL3ATXvd4o/sdqPuaUdJpBW0ucOXDNq78Pk59RZ
	 gbYlzQPVlcCS5IHy546WT/oRKgmlCPoOI5Ak/sx0pY/+m4Dig4fmlyBxrKy7m76vyh4Ku
	 vDLkaRpICCOD3qpClxQiozrKdCYT0rJ0rfOTTw1Y3vxi+YOXdL3bPqDFi3Vj/Q3H7NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o9lRP47IkEw2gtLAxsTbTVug9BfkbG9biamE/Xj5Vak=;
	b=Y6HSSvTRbYqYpQJnyW9H3bGDvM96Tz5O2zWmrg5MPcAjInomQwyE4kIW3auFHMaV1lJ/
	 oPmao2sPFYDT/H/MgALre2P5rIEodAE/4kufdpDFGbFpnqtcRPnkR1oBQBMRyO4UpJmed
	 vx3OJqZjVAWswCr4qJaZ4J31IyuK42LvgUZjpab+vcH5POCq/Edgyzo0r6kIpJfLGwUCB
	 +8K4tbfP5atjLVuPIzT+zL5Apb2hntnfFYiKLJwFbdnsa+JdRl2R2nxP7i9rSNaXRGdNA
	 KNJiIBB7XNYNm+fMWIHORlHoFkFPrzUw/9gX953jAHtEgPo+v1QiwGrL0ufVLELffEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=PcyrPwRh;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD13606A338
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DD13606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=PcyrPwRh
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9496317b730so79123185a.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1794660648; x=1795265448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o9lRP47IkEw2gtLAxsTbTVug9BfkbG9biamE/Xj5Vak=;
        b=PcyrPwRhBCE0C49+FKIAJCqWGzVmXVaIf8WH8EaDPApUzHQ3gb48lOUKAGQ35VjRDL
         Ow3ery7URY/OzZUMO/j54T4a0hj6C5cUoHV0JnsP9Xm+1+Ku2ZUlvXeDY6LZdaPpo3NB
         dk+79KGip03kDOZVoB8sSwcqlRM6H2bjS88jamgwlYGhqeX8zlMAgx9CXSoGhb0UT6hV
         U5SjPPXAhN1QL+E9yYOOY41duypqLwb4dAxUjYcsEUneyD/nCn4wEskpbiQ7egE+blzk
         NX6tbPRitfdu0KsddzP+Zn1qXlvCL8VSQKNytjMg1gwJTZOovM9uKQFrvs92N3br3u2g
         nopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794660648; x=1795265448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o9lRP47IkEw2gtLAxsTbTVug9BfkbG9biamE/Xj5Vak=;
        b=CG6aBNeZlLzyLl0nsJFOXFGUn8FYydbV1UCJMMFIpi0BwswDNEh7GmiIZ8XViGeiFj
         JJEF0adpmEg8LCd003Ik7w30ekfeVRzSDSRWW37dQU79M4DHWjll8nrTb1Tc0U4UKH5H
         OHqo2e0y54UHXgqrcI606Rg+SBmNQniEN8rQgVyo/Kl18sKst3NurLXY2xdha/mC4NQ7
         Clww4XSh3lYmzre18aGEKatGEy5s/u3umEDBK/TUos+tx/FVf/HJA+2bVIk+Kc8UsKUU
         jv2PRwMOvU435H40D45fiw4uwEFqDUPjSf4nMxPMhQYGjtfzUoAakuZdWTXS25ShBX6l
         5X5g==
X-Forwarded-Encrypted: i=1; AL+hErEAm0NEIHldu2DiDaRQESVqASTx5dYf9fLR6+E75UpYSUqgxBeeiD+ahXnw+vxIKmXylo+k7yDJz1konVg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iQLrhl9ueT3b+lZ6FhfUkKa6EsXgubCBtUjOb5UH0D6kgOntK
	d+zqZJN8TKzAzgCb+pw/zsgJmDZYAE5N7V1ZGmMh6noTrrSYEb7OVp1jD5ajBeACzQ==
X-Gm-Gg: AYBFou0z+nVvKFkfzheDp4eJJ/9cqKl5jYFiRWsdeXg7OTJR9eCgNkm2IjSKF0eSw5F
	IdegeV81Oiv0+ogrPlzFk0WbNhIQvncYAE428PgpRFzmVtxfgjVSwiHn0SY4XFRwrQqYa6WXwOb
	prVnnPYPXJmeCAIBhxe/dVKybg4nBJZk/21XQf4O8Y9fDpimLfSuaQDWoq6ytTMKc2mgmS9U3EO
	1yLaLisqcuNhga5NTNgJ2mg+ZtkuLaMQLLc4g95NDN/F5E/nqc1BuxVUH0XmL1Omx7Tegzsibjm
	gQef2JwzST8RUJhrEYFvUJlXmPdX//3+JbhWJttlKhS68yuiYcY/c5FoN5IJTAdB4WyV81XyxnS
	wylXm9me5PCOcXYUejH+LdkNGz0O8IUftgO+JA6p9DDvAHVlXq2bgG69BpwEHesKi1rRI6f6O5j
	mniDSfIpjaakHk1LPdKMlYVeupamk0lbJbOK1RAu3XPmH+vJeOqRoQMMJ8Bc1h6UsXIB6tOk6dQ
	BfgEKcFZjmFMdYt9NI1475C6HcqoRrJpX+cPX2b7yk6A4h+2YRlXXoGz2i8uvFeHhof70swOSGd
	6wzeYlNHMzMdzb/eUG8mp1/IpNpThoo7TWLxjvDH3VUMJjlq/j0=
X-Received: by 2002:a05:620a:1b90:b0:93e:bcbf:4ad with SMTP id af79cd13be357-9494bbbdf65mr776663285a.33.1794660648250;
        Sat, 14 Nov 2026 04:50:48 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c5fd154sm397598885a.2.2026.11.14.04.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:50:47 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] hfsplus: do not end readdir at i_size after an unlink
Date: Sat, 14 Nov 2026 07:50:45 -0500
Message-ID: <20261114125045.466604-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <0205ef88738917a6d307b4e334e2dd1b0851317b.camel@dubeyko.com>
References: <0205ef88738917a6d307b4e334e2dd1b0851317b.camel@dubeyko.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 2026-11-12 at 12:44 -0800, Viacheslav Dubeyko wrote:
> Frankly speaking, I don't quite follow what is the issue of the fix. Do
> you mean that we create and delete folder in one thread and execute the
> readdir in another one? Or do you mean that application has several
> threads and one thread do readdir but another one delete file by file?
> How this deletion is executed? I mean which files are deleted?

Sorry, the commit message was too short. There is only one thread. It
reads a part of the directory with getdents64(), deletes the files that
this call returned, and then calls getdents64() again on the same fd.
This is what "rm -r" of BusyBox does.

> Even if we delete files in folder then i_size is dropping gradually. If
> we traversing the folder's content and ctx->pos >= inode->i_size, then
> it sounds that we already showed the existing content. Do you mean that
> if we deleted the range that we already processed, then we miss the
> rest of undeleted items?

Yes, exactly. ctx->pos counts the entries returned since the start, and
i_size is the number of entries that exist now (valence + 2). When the
entries that were already returned are deleted, ctx->pos stays and
i_size drops, so ctx->pos can reach i_size while entries are still
unread.

A small example is a directory with 4 files and a buffer that takes 4
entries:

  getdents64() returns ".", "..", f1, f2   ctx->pos = 4, i_size = 6
                                           rd->pos = 4, rd->key = f3
  unlink(f1)                               i_size = 5
  unlink(f2)                               i_size = 4
  getdents64() returns 0                   f_pos (4) >= i_size (4)

f3 and f4 were never returned. Before commit 4b0496432844,
hfsplus_delete_cat() moved f_pos back for every deleted entry before
the saved key, so the second call started with f_pos = 2 and returned
f3 and f4.

With 1500 files and a 32768 byte buffer, the first call returns 1022
files. After they are deleted, i_size is 480 and f_pos is 1024, so the
second call returns 0 and 478 files are left.

> > +	bool resume = rd && rd->pos == file->f_pos;
>
> Is it possible that rd is NULL here?

Yes. file->private_data is allocated at the end of the first
hfsplus_readdir() call that stops in the middle of the directory, so it
is NULL before that. The current code has the same check
("if (rd && rd->pos == ctx->pos)").

> I don't really follow how the resume variable can help at all.
> Probably, I am missing the case. Could you please explain the issue at
> first?

resume tells apart the two ways the function finds the next record:
from the key that the previous call saved (rd->key), or by counting
records from the start of the directory with ctx->pos. It is the
condition the current code already uses to choose between them, only
computed at the start of the function.

When the call continues from the saved key, ctx->pos no longer says
where the walk is in the directory, because entries returned by
earlier calls may have been deleted. So comparing it with i_size
cannot tell if the directory has ended. The patch skips the three
i_size checks for such a call, and ends the walk when the next record
belongs to another parent or the catalog has no more records.

A call that finds its position with ctx->pos (the first call, or a
call after lseek()) keeps the i_size checks and the "walked past end
of dir" error as they are.

> I really dislike the comment in the variable declaration section.

I will move it out of the declarations in v2.

The HFS patch (1/2) is the same case.

Thanks,
Hengyu
