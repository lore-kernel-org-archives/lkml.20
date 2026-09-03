Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5554B4EBACA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451870; cv=none; b=ND1j3E24iEmR1CFkxyjTTHVEhI4U3f5j/jTDwgea09GoHtUCD2Ej7DUNWBApfS4VTbC1TAe7t0x4Wbr6Jg+xD3jtFwEq2XQb/o7YszWELkPBqrRe1nGCfOBPm+ISqY45+WD7h9T3QKIw6sKyneOpYIl7K2lzbvvQeAiIBcH6A80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451870; c=relaxed/simple;
	bh=oZCzF7U/pNqSGCBx7Lc2XFggzKryAdR7EYUb7XoIkuY=;
	h=From:To:Cc:Date:Message-ID:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sJiQY7hUHbBFQK3aO+d+4de5UoBrseRnZ+2wxIZglURlmfkWInZ1ErZa6f426Mkr+S2Ft+Y8FXRV+IjqlVyZ0MxOo92Mvp1+DoTbxgeZXrAc1J7GeXURqQo64V5A4ut17itzDBgVswZas8fCMwh1VK2OU3Gmo8qqtq7j6q5jvGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYrQwO7Y; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYrQwO7Y"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-484361a8e38so5287f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788451866; x=1789056666; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:message-id:date:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oZCzF7U/pNqSGCBx7Lc2XFggzKryAdR7EYUb7XoIkuY=;
        b=CYrQwO7YRxSLIGtdoSpREAm7iPBHFgW0/rW/+b0MgADVl61csPLfOWE+W2wRwBLR6v
         ted+Ev4szN2BlL7fQPcS60ZWYgRnidYnViDpQJW1mzVgVsVTEG4H0mhhwtzGoLVeSyj3
         qIGtqzFOToMPXGSzVOlbU6RhgY75tTrG6UvB6U3kG40f9ho2M/1eZHZCV7gjY8NwD3oI
         AMiY1Bkm3r+ICLqS19pQXZn1WA7krrjQLn26uRk9c1QhBHUb06CrKiegXqzwgZx04Iux
         kPov6gpUrOTNK0q5osgcJwDcMjQb0QLSvOLbI0v8VHpSyG94NS3OHcQ/RINveIfYrmkh
         H9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451866; x=1789056666;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:message-id:date:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oZCzF7U/pNqSGCBx7Lc2XFggzKryAdR7EYUb7XoIkuY=;
        b=XEOiMN4sgNjZD/zY38lWXVjfHC/pFmhnomRN2uXZLEKf3b2aexnP6hhAblAIbmqJ+p
         lJKtYWBaPkV40DoGkfJGWMKjBeM2mL4bFAoM7vq3UpTevfyrnzStWcZYH7EmyS9CqEiM
         erHGtpZSy0hsleRfSDyJdlxLoGghBLw0enkE7H/gKefwaJ+vyrj6FabXY/9PQaPwRGtO
         cvIsHkibxyk4151CqnBZ6WEdernFqB4qbp+0grUSfXw8lTUKidgMZPkmkEHPWy7eCbw1
         efbm8KZ6iQV1yoPOo7lcjpVd6NxkUWOcLX4F1LpbLV6nH+37RWfcNdYkRO88gQJm4ShJ
         8dng==
X-Forwarded-Encrypted: i=1; AKwUvBzZ8mh0Ro/BLpKoyhZaTy3YMNmv0lX/8G7fvOo4hUU3u5PlBySta7KiNwpalYoD15r7UpDn2bmpQ9O4me0=@vger.kernel.org
X-Gm-Message-State: AFuF++lUBDgexHEbVEHu8FiAWFuZBi/FxyEvfORwNzDL7x4AQ/o/ZdXN
	zj1LxYnAGQmUoZgCbU4VgoK1f9zpOkkPIUEZMdON3cl7566I5V44KT2TRhGoSRmi8hg=
X-Gm-Gg: AYBFou1EF6uu5sYsbZ8S2D1xFKqhn1l037dppRLwfjSruYICKV/Q9Mi7B7YsEZr0csI
	VglRgGnI9TvkPAlls9xP/fMI/qyVD0o4YhgkWMMB55J6vGGXOsLPDFKSlkiI0xJkejwGSquXQnn
	dbNGsgGd3pws4fmzvSS+PVShkxd8H1pJnAVdSFoXBtx8qmukGvo4gbUjx0EmWHd1oaciwsDefJ+
	12mjtsDBPNtr+gTLpQOQe2DECxi2s1j6UC4dZGhH18c966OmvFl14Ew8614nBiqb7OKUvRIQEZR
	wmYzv2qTVdpdxlftYpb/osMmk8a2Lp9Qjvm7v5GeoVmKHtwDQtstHovsJNPwvfDcGHiWnjwDyyE
	PPVxwhD9/cWKxr/lfF0smsWQnNfI2jsfDKcYtEWe8vNJ/Ygs4JhOqWMFM4dU//hb6Cqz7w1LNbj
	1BMqx243FdXHBigmk+Y3jNNTGUt6IhMogteqzwTj2edQolCgForb3DwBGMCTc/F5eHLcX8NkQLn
	4adLfRNJtuyx1jyUUmLYjht0Sfry4JeATWgVnzXoDuDiN+s255YieVJdtqzilTeeOETGboMxut2
	psjQ+ZlZGYaqHi6Fq+iL3eI=
X-Received: by 2002:a05:600c:530c:b0:499:cef6:104c with SMTP id 5b1f17b1804b1-49ce58369f4mr111926625e9.1.1788451866233;
        Thu, 03 Sep 2026 09:11:06 -0700 (PDT)
Received: from [192.168.1.144] (98.102.222.87.dynamic.jazztel.es. [87.222.102.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf2abe1basm49686565e9.10.2026.09.03.09.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:11:05 -0700 (PDT)
From: Miguel Garcia <miguelgarciaroman8@gmail.com>
To: stable@vger.kernel.org
Cc: pvmohammedanees2003@gmail.com, akpm@linux-foundation.org,
 joseph.qi@linux.alibaba.com, mark@fasheh.com, jlbec@evilplan.org,
 ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Thu, 03 Sep 2026 18:11:04 +0200
Message-ID: <178845186455.1865019.8043691693828475058@gmail.com>
Subject: Re: [PATCH 6.1.y] ocfs2: fix deadlock in ocfs2_get_system_file_inode
In-Reply-To: <20260903152421.1801322-1-miguelgarciaroman8@gmail.com>
References: <20260903152421.1801322-1-miguelgarciaroman8@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Please drop this patch. This branch already contains e79c0fc4f61e, a backport=
 of upstream f5b1910e23f1 that removes system_file_mutex and fixes the lock i=
nversion. The older trylock change is unnecessary and can cause failed direct=
ory lookups. Sorry for the noise.
