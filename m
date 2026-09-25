Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228FD3DA5AE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356068; cv=pass; b=aTJmLnap3S4wlvAimLAQDbNcMmNAvR9LvQpBO/tf9jmRXyPst0mI0RWXz0h4aWCn+uqcbyMdOwushjRNKk7iKVJrEwlx9Og7G/YcWztqg+P3NVyZz7ZWBLDzD9ss8aZ2hNQ/DexNTV6KDl+7HoAlbPVCTopZzjA+gOlTkD3Ckcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356068; c=relaxed/simple;
	bh=Z/QlDjEqmTsvd8hmVsRhjPJAPZKduCsAshcn9SEcHsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FtKkcxMzGUNljJms7SAF0NQbQeHNxPjTKCZ20oWAFCN4HDIvZ1n4slBNOFantsiGREZ0KzticrgVuNiaeOY+RderuE2UIyEz97ChdlSRcPktqJ6ZPYsPVUZxXEKXK6hw1EHDCWdlH2kQx6HZikoZl2rwBrY8ViZCbFCGwS+lnaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=JQ7vBslB; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="JQ7vBslB"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f05ffdso5082815ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790356042; cv=none;
        d=google.com; s=arc-20260327;
        b=A+0/WTxUXzmmbfyu5uJTI9yp8T9tMJY9liMqHdsakdaJUgGk0hVTByldI6Sppk+OjS
         NbriHdOajYdM6Vpa3jV5wMFTnz8dCA7cjTC72yfEeNFbLV0n9NYDkcgaVMziQci+/yvn
         fdl6k177gHj/YbDR/oKUSH6VSGY0WuWeCG6rvgbeXvzjJFSMWl5bjwLv51Jz/iXgQjJf
         wS8MXQN+4nda0HYgXkU0qwXOtad/q21awXB4CAK5tD0cY3jdLhs6EvJJPTrPocljpNbJ
         a25X0BbyhrNYNoiYHdGxDwMywkGM45i9MCdoxF18QBROSwXYiJq8zCbMM/21vU6K8KGI
         6i3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8YwzIASUiQRwU6GfvzkJObDJseuyBEMVP7g4XrNm/58=;
        fh=EGQy0eZPllX/pm8opsy/becIOVO6AYJ4LZYHG/dveGE=;
        b=baVJKJUHjj4bFJw0wH8xUggNCnAo8jDxRKJl1vFJHxomdViYU8fy7gZ05yFrAdrjT8
         lnXExUT6Cr5YEUv6GuwyE0inUTDCpVO580t+3YfwLTrBma8t24hjnGRI2b/GYI8AuU08
         OhNIgGPVJEk8b4FYFDYAXl4XheaHswQl/mheni1T1JDqbB2za/PCCb8TUHzdWnULUg+A
         MqBcvfCnK5JhLz8FIWv/8wd6Z8cm/k0aX45lY/R/FjQJBiP+R2gIW2ecKTyagiJk3eoi
         coxBVZs50/R32eV6BEvcUd8tdW/XPoVsVzjPWh9OXQTHt/1SuKj6Rza3hmuSj3I8yC/7
         u5dQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790356042; x=1790960842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8YwzIASUiQRwU6GfvzkJObDJseuyBEMVP7g4XrNm/58=;
        b=JQ7vBslBA75Oz3vhccuiegu2ZSCVFqSF0HyjC/3/vNzOkrP+yD6f4D4JjYMSYAoFrr
         wlg7Wmn6oEu7SXRotz0a67VZfHRO6XibZ9ZQ2iaB3D1nQj3Xnbu+DnvAmLPuwuabcTJk
         PXz37aU1zp89S9iK0/x3WEyWrQZ8hNLRiSYpSLIsFe52Q0ZtYHr08wUrk94pc3ENWlQd
         J+Tedgfpmw+/PX5h3yjumGEOqc+s3rcWYPx4Hn4luwZxasnr3NVcHxFxvCE/jfitgeBw
         +jOt/CmP2fD13Y486VYHbVYAPN3U4OMa+qtVuZhbWJD5jm5g1hu0o/Zq9FL93oXYU7V4
         vv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790356042; x=1790960842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8YwzIASUiQRwU6GfvzkJObDJseuyBEMVP7g4XrNm/58=;
        b=tBE7Hh1N3ODTzU8KvNsThCCnPawrAVlOuuqa/kxA6G94o4TCivMYKFCiHIK9Vn2GlM
         iui+OnJxeUkMxCoHlu91GEXVo+BqKY3rqaF4pxHx0YgBArYATqRFEw4hc1GlsxZXIBIm
         EmNrIANsXunlQmm4+o2OrrPSMUx/GvDXXDwi250UOKbNvioOvm8L/CG5HWrRQ75jJ+ug
         FjS+XRm9j1DTSirPj58p10txj9z0D+UvWRPkwFw0cO2fqhO30g1n0n1BGJyHDH3bzTX6
         a6P/2iW2xWEi4ve3ocz8WJs9u6Xhcykz3wsMtmvjMRbCY8MgmLO8A6ttNi7SedJoQLuy
         l02w==
X-Forwarded-Encrypted: i=1; AKwUvBz9mrB94Nf4YHG9z/m1Aosk1c4/8rDsjrkcbA/LIn7uPzC3YVOqXvxq4ZaY+nyI1T/WryebHGBkpP+AReU=@vger.kernel.org
X-Gm-Message-State: AFuF++k7+HExrODoxNfl+gmYWGHWptRSYfSaHxYYchkwtAgHhkE7DrJS
	Q/LsMeazWHD7l82W35JfBuumds+37tyFtPVy0kKLRikDCJd3mdLfixCfS97n0qSWgOKZEOc2ji/
	rQs9F+FVyMqL7oH72AoQwScnLJXs4bmHxKhLzk0cX
X-Gm-Gg: AYBFou0uNdxSVT/B2EDuzQsNS8jfsDGuVuUOKQ8djlu/anpw6DP3XsPl/mRD9oxnLY4
	AZyg0ILkbWmpbstTA40DV/kbTe8uTN28XyxxJze1H9yXCfqL929m7OVbuI7oWQa+2SBOaG8QMPy
	4EMVUTLBk9qQu/xCTz9QJ3W2bveR/NIhYH3ZBSlOq7Z9ZXupqD3zswNjb1oC5nvDiehduxMs7hk
	uK9VKmjatYgq8ei2A1wY2YlvgNJz1C5h1qxyD0J9lqABhBwpDm9kkp3m3AR/mwHViqPFE2Jpxhr
	mWquLPjTwQij2LEp5aa6TpeiVjTLsEWJwvvRP4QXc20Ljk0mlBZ9yS/OR5ILBMd8seUaYduWIIO
	pCz8Yc7Caml2mFYA5d/aeHA==
X-Received: by 2002:a17:902:d48d:b0:2df:99e6:9448 with SMTP id
 d9443c01a7336-2df99e695bbmr12902675ad.61.1790356042370; Fri, 25 Sep 2026
 10:07:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924104831.1081137-1-caixinchen1@huawei.com> <20260925-zahnersatz-hielt-lerche-141893658522@brauner>
In-Reply-To: <20260925-zahnersatz-hielt-lerche-141893658522@brauner>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 25 Sep 2026 13:07:08 -0400
X-Gm-Features: AclHuK-PYyMWIn_xv6i13K6lF_3RP26uUOO_mtAnUMGHNcMrV5ydBitx8qn_ri0
Message-ID: <CAHC9VhSeXmOHvioZ12aVmnOtpP52-G=K_jS3K0fTSiCrDHStPw@mail.gmail.com>
Subject: Re: [PATCH RFC -next 00/12] landlock: Add READ_METADATA and
 WRITE_METADATA access rights
To: Christian Brauner <brauner@kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Cai Xinchen <caixinchen1@huawei.com>, gnoack@google.com, jmorris@namei.org, 
	serge@hallyn.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, gregkh@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, dlemoal@kernel.org, hch@lst.de, axboe@kernel.dk, 
	viro@zeniv.linux.org.uk, jack@suse.cz, dhowells@redhat.com, code@tyhicks.com, 
	linkinjeon@kernel.org, sj1557.seo@samsung.com, yuezhang.mo@sony.com, 
	hirofumi@mail.parknet.co.jp, cel@kernel.org, jlayton@kernel.org, 
	neil@brown.name, okorniev@redhat.com, Dai.Ngo@oracle.com, tom@talpey.com, 
	miklos@szeredi.hu, amir73il@gmail.com, senozhatsky@chromium.org, 
	chenxiaosong@chenxiaosong.com, zohar@linux.ibm.com, roberto.sassu@huawei.com, 
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, 
	stephen.smalley.work@gmail.com, omosnacek@gmail.com, casey@schaufler-ca.com, 
	nanx95726@gmail.com, djwong@kernel.org, daniel@iogearbox.net, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	netfs@lists.linux.dev, ecryptfs@vger.kernel.org, exfat@lists.linux.dev, 
	linux-nfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-integrity@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	xiujianfeng@huawei.com, lujialin4@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:33=E2=80=AFAM Christian Brauner <brauner@kernel.=
org> wrote:
> On Thu, Sep 24, 2026 at 06:48:19PM +0800, Cai Xinchen wrote:
> > This series adds two new Landlock filesystem access rights,
> > LANDLOCK_ACCESS_FS_READ_METADATA and LANDLOCK_ACCESS_FS_WRITE_METADATA,
> > which control access to file and directory metadata such as inode
> > attributes (mode, ownership, timestamps), extended attributes and POSIX
> > ACLs.  It picks up the work from the "landlock: add chmod and chown
> > support" series [1] and follows the coarse-grained grouping discussed i=
n
> > that thread [2]: instead of separate chmod/chown rights, metadata
> > operations are grouped into one read and one write right.
>
> This is mostly fine for me. @Michael, for the fs side of things I would
> give you a stable branch vfs-7.*.shared.landlock.path that you can pull
> once this is ready.

This is in my queue, but I haven't reviewed the changes yet.

@Christian, I'm guessing you will merge patches 1/12, 3/13, and 4/12
since those are the VFS changes?  Once you have a branch for that, and
we have all the necessary ACKs, I'll merge the LSM changes in 2/12,
5/12, 6/12, and 7/12 and then Micka=C3=ABl can merge the Landlock patches.

Are we all okay with that?

--
paul-moore.com
