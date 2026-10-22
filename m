Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792659825;
	b=zqRJHNK6muWwqSroQovYKLXuoCLROmKew5rrz11v3DkyFeCwjo3BAeyXx3QHuljOvoAM
	 Rz1yR+HyIyht1cuYs5s9XN2WBHWaQWW3srsBzZpke1Ng43W8pfmWPVG7BgFxhDICQ3UUq
	 4caDXi2aS+15y1UNWPMVW4hCzl01/4qRnKgiBnry8znaA1UnfqXg//XRvn674CZe71rkk
	 Pob4POzLDnEe7Jfl5KwXh2GdnY8++1ScRG+BLc7ciGtWOV31OdBDW5UCpDCEe9NuOdhM8
	 nKEE0Bcr5nz3DV78oi52hdIyWXEqciOQAVXH5IgNty+4taVtTRqzaF1hhKfTp1kZF8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LWhw+HLJxYgscIYvU2wsKpAHdSFa/l1EBTg1QHDwjyM=;
	b=CUBVuCHoYNVNd2ebySz5ZfxFLL1X/aHRD+v+7M7xvfmOVnsD+7J7CvD+e5rWtabR4dYC
	 n6HvB06EGKELv2jTZC7apWlIw6IA16Mf5AgW7ZmBZc1+Ukwr36leNhbQcP4lMWfn5AK6K
	 rYEGLjWkYoL3czGDqpxkhVdGIkY9kGNLLeNAY4avCgQ8sd9V63i3Mr2Av5M9n7G7HMFta
	 hT/iSwdNzM+o/swYiglnM6nriFQy+7SLOVDwNngFo7MXCq55KMJq/PiKcbV4hMODCdapj
	 cDtV7ExJJjNXFIG/e8WV9cCSiLr8hfMv1Ow3Ns9pcg8XYUEMtiQIf1diZb9gvL7i55A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FinbhuvJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE774606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE774606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FinbhuvJ
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b10d24345dso15266317b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792659824; cv=none;
        d=google.com; s=arc-20260327;
        b=nMZ9eEiGFx8H6+Qe8SAfatL6OxDlQRwmDMdWIjY9b6ANnewsJb+fBzOCJVEl+6XpDE
         FqIXV/vrGTYqNne2zM3vzGzYxWR4/P3Ksi+mhti3jz6YSDWFGm3s584RAZ5xePfL0orO
         R1hQjlLV43CaZrDH0j5/bVBSQm3Dv49XJDyGvW4Pjfmpy2Pt8FFURiNilez5zmRzA1vX
         KERxj8uw+BOW5bg42ziNHoLhJPS06V2ZOL76eeUzAAAnpIcRvKQ18awLz8vcGsEqhn+h
         4HspmpkPL+siwhrKW0Io5SPfzIjr/1/Byi142OOoTaz3LArzkssOJ9syYFmXzrfTQsP3
         NsJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LWhw+HLJxYgscIYvU2wsKpAHdSFa/l1EBTg1QHDwjyM=;
        fh=PB8eGMlY8U1qDfsGS3e3PZY8VMVbQluQ1VSSYaBpKF8=;
        b=KofEk8MBhUM+r41sbWQKGw8RLhVNPwMv5GVWAEflDm0hR9F+JRwcgC2wiMyNzOt/I7
         O6pmf343eaY8dQ7iprwaIR7KwbV4TEZtT9DyYlDSkhqCcSCOKlZy82rLljN2uHYhN6ZT
         iYw9FXzFE78xzolDTNnYBHsUJJKBxWGTuGePxwU+MZGg4Zcrym0GQ/Zyfh3NSVNP35s3
         wwl8/puksZKV+9SG04wiFrr2HvqJJagtfLKP4LfPAkwFYwAlDY2uqAPD8N8Hh983RN5O
         WV0vsXx+snYPGtE9lT3NfMPfQsdh4sY+LnmbhrsoWWS7qtuKNINl3lJxU9LM5viPpxsz
         Xliw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792659824; x=1793264624; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWhw+HLJxYgscIYvU2wsKpAHdSFa/l1EBTg1QHDwjyM=;
        b=FinbhuvJOlnR1YfXL2LeLMw7fnp4FfdEx88p27qSm/QuCdcxkCD3XNkj6cciRNl+kM
         XWYLPl9YQQOIxn5Sgamj4n1pSRbfDQ4f3Nqkd8EIDaQI+7SWA+FJtTG3pjXi1QGEMy+O
         marwTlnH/N/cCbOYMi8KQw2haspqopRoQ1Ob78WgHfe7yxhdNiEEYvS3jLxqWEb4HKkX
         rthJJeonSTtQgSSpJF7aOMUCqwB+Z4uJbeP1n3Q7LDmi2BGSZWS9VdCRu2PtaGMUf1ch
         Jxbf2uxPCUZ3ZZCtX6z1qLdR7U2/5C6dqsFZYJP/Ga9UDzI3fBGYBx2lIKxzkSILrCF6
         DfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659824; x=1793264624;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LWhw+HLJxYgscIYvU2wsKpAHdSFa/l1EBTg1QHDwjyM=;
        b=xD1jrckWxJMcdYl+BKU4mLwDFMd4g8yFW2r6h3xtKR8kfFS2coAyCThaHy1mr+iwbR
         RhLRMY2bXYBCZuNlpvi/ewkDoEJXcfWgIkex1F0uSVAzL2TMvZG2Hgv477k0ExHRjM0L
         sLo9JBsYG1oQvW8cA990KwGhGI9G1K8HfBqzUMaMUFiJaFjW3s3btzyr/n4g61yoh1mA
         +Z26Pyh3G2phYDl7IBkoAm3bgVp64dy56Iiapz9Z8SnlFlljb4vR78mQhbH9iD0ZoNyZ
         X7aEBFXzo3IzwYh7cozrevz20dIabPTnG5rmXDnAtFUqj2Q5tH+5A56Kzs8Ioo6e3fKi
         r5JQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYtggbMRmFr8+Mhyxh/+N6habP6DDcA6gyb+vFiw4QhHL+Gz4RpdcTdsPw94pwwZmXe+k0eiTsi9iGJ/s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIozmGZckp4W7osVdMVzeOMNKk85YAydj/vr417UgxuReE+b5HI
	NGNWfKPjUwwHv6oyk7DbqowqnQcV9fWx6cXVn5pu/IZAzVLtqfumZoA1e4u7QL4HO4s+bAWr3ix
	pI/0yOXU9Dt6uZ+je/yDqpZJPj0V9P0KLiPo9koKtpu9A
X-Gm-Gg: AYBFou2LXMBIjjOx3uOk2MaMtYdqkHGRGje/7Nq+KYPLDMlnRJwNBvd1C6rX+x3R98k
	3gWGhwDi0JligjFKN67GesnTpBldVDEEBEGMWYZNTQDn/sf2V6XAZRylWfREO2dn4+ojfAZm8OD
	hLX6COodxFuQZfqb8t+0EusR0ughcLp7oBYWavdrUm+l64BRirOVjbsEDFgD0RJ+qBqP5IIZkOp
	25+MdS1v22Mv0weTk0GQADia1y+eF0Elr3GJq1/GBcT9QYfyW2Bkfz8zfBgQbkYj6vVmhWaUqvZ
	fcye3x/LBoAm3KHYzW73vGrCE0f71ys8HSrCfAFnsqdvVeoqPoJ2mk4IdJFnvhu4ePnM0WclxDE
	XJLAPRjsNeo8VXGRywK9H/OBragxHtmpSpnmQBVI=
X-Received: by 2002:a05:690c:e3ed:b0:8b0:d9a6:dbcd with SMTP id
 00721157ae682-8b13406330dmr30687627b3.48.1792659823756; Thu, 22 Oct 2026
 02:03:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <pm-ocfs2-objects-candidate-0088-v6-d3056754af7e660155d9-0@gmail.com>
 <pm-ocfs2-objects-candidate-0088-v6-d3056754af7e660155d9-1@gmail.com> <9e071e7d-ae86-4b55-8609-1f00a0deb913@linux.alibaba.com>
In-Reply-To: <9e071e7d-ae86-4b55-8609-1f00a0deb913@linux.alibaba.com>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Thu, 22 Oct 2026 17:03:32 +0800
X-Gm-Features: AclHuK-h6BXGmIG1OsOHu9Jb9Mx2Z8xCnybGzVquX23jnd9uB-qla6UpJFXDbIM
Message-ID: <CAFRLqsXgk51QnjPDoZ+5JmLSrY_M0RWPtc0bMEAqt3Ee48J0UQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ocfs2: snapshot dentry names in file-operation traces
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, heming.zhao@suse.com, 
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Joseph,

> Seems ocfs2_setattr() also risks the same race, and it is missed in last
> review comments.

Thanks for catching this. I've added a name snapshot around
trace_ocfs2_setattr(), passing both the name and length from it.

The inode lock does not exclude a same-directory rename of a source
directory, so this trace also needs the snapshot.

> This looks wried, the inode is dereferenced above in OCFS2_I(inode)->ip_blkno,
> but checked below.
> file_inode() returns filp->f_inode, so it seems inode is never NULL here.

Agreed. I've removed the redundant NULL-inode check from
ocfs2_file_read_iter().

Both changes are included in v4.

Best regards,
Cen Zhang
