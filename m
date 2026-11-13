Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597256;
	b=ozxAlXavr+tN7wA+EWOKJKbGF1QzIGpdlQTznXbiPFkthzXYBE3pxKyg4bs9hKAnMULh
	 BvOo8FWGXodbihAy7YxMmtI3WVQJJQ1+Gx+1cePGXBim5BypZpvNToychLNwurp3U9/p9
	 VfB8b8AHeRGtY/cPLAM3AN3yhObXvBrJNgSCs+sMUeqakZzZQ/wXP9jCKMQfNh6nN2ZBq
	 29QT8CWZHKvLgglv5RWfSO2u9EuOpYDKLmqy2nTJ13JhRUS71SRvbDJtum3iH3FFJsx5N
	 H6ND7N3ags7nZIOYufIcQciAxjnyWfV4SV1H7WsJm42y8izmW3L2+rmNTY33wNzt2Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=naomhjRVZ+IJsznibpYW1bEFswFz05AA59NadPrGXtI=;
	b=5Sph1S2uggu9Ko8EWxF/hLx+724vFuPWAFBMXBDYG1nXXMcXYG+ALMYovVudyVr4V3AS
	 Ewa0S6/m/TvY0YACr9reSQbRFdbn3uT9ya2JT2PcMu6c0lVqE+f2ONd9PwK8lE+UtavCc
	 yzLXMq+5QB2rfm7T2FXMa3Lc4iBFmZAcc9b9bgAinAJqVdXTaOPK7nGJVJoNvmmSR7LTy
	 lvzp7JSEKzQ5Usx4WbWKLY/MEad3is9sMH1a5DevL/IfQLuXP9Gt0xT8eQaP99C7FLxO1
	 gy6O2jQYf0hvwPvO6q0v2WVs0pint4SvwNYgXaRs9iPuCLN2xGFtqgwjwzKrBLtDMfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jm+wy5yg;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E00606A881
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39E00606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jm+wy5yg
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b309147589so13139697b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1794597255; x=1795202055; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=naomhjRVZ+IJsznibpYW1bEFswFz05AA59NadPrGXtI=;
        b=jm+wy5ygWGsdY+Ma+99qkE8tcIX0YUU2ekNVzRJEIKwI8g5X0mZlvtaSJRJW3sV7Pv
         DUGnWRWzb3Lkx4JaDT3Ebx8ecJItSNiUOp5HA45GTWTPRwQ2AuANnucylGfv8H7NJCUS
         BVilqj4f4Futpa8fT1Mt/lS6IRv3ST07SGUj+mJkytFAZlzfbIvZReMU/VZJSGuhY1xx
         EkBRgR68kFfGEuobFKAgoyvOoe5TeCB3r5cDMfKsRB8cPHVqt9LO8/mF15gcBpeyUnwT
         6hq5YiCoV/CBJjuWHLxlnFRkpM9Jd2bj83D4CP5nFjqvNZMqJoQbV976KtVyEbwE1/tO
         72Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794597255; x=1795202055;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=naomhjRVZ+IJsznibpYW1bEFswFz05AA59NadPrGXtI=;
        b=eHkfvWBl7w79AeJkz7B1OFo9CQ/km2kA9taNifP6aUzQn7J/WW8RaSvTPCzpuolCrO
         Jy66yQTovN0qGLejMuaISOGb+j/Ax+y0VnGL+KjbznRQnhqvz82kVuY770gcD9n5EPsg
         9LXzKVjmg4rfCtxbFFDrvZVx1pP2nUwqhapu6iov/xAku7+eA1PSqghh6HGZRMHv5WM6
         tOCkRV2BDT2LanvoI0mAJNzP21JofANlDJoMpOkT90dzxBROnQOIT0AYbiR5QSacx7yh
         nb70JGnWINSYOISebLHBzzX/tSOjH038BdXFCCF8SIZ16zn3YY7gP2CyYVnC6TLLGouc
         RduQ==
X-Forwarded-Encrypted: i=1; AL+hErER+79pGosKwgV+pl3flHpuDaYyN9hcviv7aNzNdfs3UhDWT9VCRWA8ORFVDWsxJ6zzRaBDQKfAxwQxcfI=@vger.kernel.org
X-Gm-Message-State: APuU4Z83tunKoMDhCy+ZlJXvS1iTnLIWWzwCttTZjMXEGsEwjmj73w56
	Hg+FdxWg9lguJGGJD72U27IZwU01TTiVxUCAYG85cCz3PUY9oUWqy+5pvJ4S/7gTZ5s=
X-Gm-Gg: AYBFou2kSI1lKjRQ8919JrK6SJZp+HKz0bMEd+E5cOAl5/WWHJyoOitx6raEQp8aVhu
	r7X8J84vExNXGHJVSkW/PsZe0AJ/O9QSrSRTAHx6aPjcuugODeHU5FSkpO678cTN8qkUGPLpoH2
	VwjAt/g0k7tXjaD4YvAQBabwzB/SZU7d1r2/qGCe5X1GDJKLRdf2/Uk2kyvjpi8MKqS2IoiPyBv
	Ghbl7Bw7yuOLtf8YPdziK948kBG5hCQLVThT+eQjjCxwlIMb6zIDzn0OpLvRlVwlyZPK0FKqbji
	9NydwACv022ZhCvALGQS3yhdoRASoIJAXGXJBkcoKZbehq7eyJmSxQU/ZXm9EfnZ/hwdUBoEGkC
	8gj75v3bwhLVW3xiqpVD0d6dzI8IBT91muAJxGijg/7m7Re4fNMpegArORqoWbm/yxW9uyvknU8
	WK1VNANmXNiskLfNCOxhHMoYJIiavMgP9mM3fsAskyxqZRop+E5uBCgAW+rAtIjfx0BCmQDsluj
	2aBxbAPDBfSeLsEdjTokYkMX7ubDl0iDKkcBvLbE5Ru1Tmf1B41v00Rw7To/jNN/W+nbfbvix38
	g40LOACyIqdZCg94aPyudFy3CpTBf2G2onUdAy6cDQqCKTNJ8DoZ/9RSB7WIuWgVbGWhB5GJ5vZ
	BuF6ZE/RrDCE932z2Q7YgwLursPrIkvtoMeJZ94h2IFETAEx8Va3RNXCBfRnuqYn7mgB1p8pSxV
	QH41rMUeBeF+LRqikxzH4=
X-Received: by 2002:a05:690c:e3e7:b0:8b0:ecb2:8861 with SMTP id 00721157ae682-8b4aa327872mr23049057b3.63.1794597255053;
        Fri, 13 Nov 2026 11:14:15 -0800 (PST)
Received: from ?IPv6:2600:1700:6476:1430:93fe:5aa0:2dc4:7807? ([2600:1700:6476:1430:93fe:5aa0:2dc4:7807])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aaa0ea50sm26909557b3.42.2026.11.13.11.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:14:14 -0800 (PST)
Message-ID: <0a8b94b8985ca42018f840eaee7c8b4fb90b21ca.camel@dubeyko.com>
Subject: Re: [PATCH v2] hfs: avoid reusing occupied CNIDs after deletion
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: glaubitz@physik.fu-berlin.de, frank.li@vivo.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Fri, 13 Nov 2026 11:14:13 -0800
In-Reply-To: <2bbc10eb1dd5ee69329a9307f14fd15b1815b898.camel@dubeyko.com>
References: <20261112110128.4082071-1-hengyul@cs.unc.edu>
	 <2bbc10eb1dd5ee69329a9307f14fd15b1815b898.camel@dubeyko.com>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
 NFdvziOa4FgUBC4X71upsZIoZJeii2V/Jtc3B4g==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Hengyu,

On Thu, 2026-11-12 at 14:34 -0800, Viacheslav Dubeyko wrote:
> On Thu, 2026-11-12 at 06:01 -0500, Hengyu Liang wrote:
> > Commit a06ec283e125 ("hfs: add logic of correcting a next unused
> > CNID")
> > made hfs_correct_next_unused_CNID() lower the next CNID after the
> > newest file or directory is deleted. It takes the CNID of the last
> > file or directory record in the catalog as the largest CNID in use.
> >=20
> > However, catalog records are sorted by parent ID and name, not by
> > CNID, so the next CNID can be one that is still in use. As of now,
> > creating a file after deleting the newest one can fail with EEXIST.
> > Commit 6592287869bf ("hfs: fix incorrect inode ID assignment in
> > hfs_new_inode()") exposed this issue.
> >=20
> > The issue can be reproduced on a freshly formatted HFS volume with:
> >=20
> > =C2=A0=C2=A0=C2=A0 mkdir z
> > =C2=A0=C2=A0=C2=A0 touch a b
> > =C2=A0=C2=A0=C2=A0 rm b
> > =C2=A0=C2=A0=C2=A0 touch c
> >=20
> > Without this change, the result is:
> >=20
> > =C2=A0=C2=A0=C2=A0 touch: cannot touch 'c': File exists
> >=20
> > With it, c is created.
> >=20
> > Keep the largest CNID of the records in and below each catalog node
> > in memory, in leaf nodes and in index nodes, so that the root node
> > gives the largest CNID in use. Adding a record raises it in the
> > nodes
> > above, and removing the record with the largest CNID makes them
> > compute it again.
>=20
> I am still not sure that this approach could work. If we haven't the
> thread records in the b-tree, then we sort records by parent CNID.
> But
> folder can contain child with any CNID. So, if we keep the largest
> CNID
> in use, then, technically speaking largest CNID - 1 can be located at
> any node (it doesn't matter if it is used or not). Even if we found
> node #1 with largest CNID, then it doesn't mean that largest CNID - 1
> is located at the same node #1. And even if we cannot find the
> largest
> CNID - 1 value, then it doesn't mean that this value hasn't been
> allocated already as child CNID of some parent CNID (because records
> are ordered by parent CNID). Are you sure that this approach will
> finally work? This is why I started to guess that maybe we need to
> think about Red-Black tree that can keep deleted CNIDs (however, it
> could be not efficient way).
>=20
> So, I would like to be convinced that this approach can definitely
> work
> before taking a deeper code review. I suspect that we still is not
> good
> shape yet.=20
>=20
> >=20

I've spent more time considering this patch. Probably, my worries could
be wrong. But the main issue of the commit message that it contains not
enough details about the problem and how implemented approach is
solving the problem. Could you explain it in more details? It could
help anyone to understand the correctness of solution.

Thanks,
Slava.
