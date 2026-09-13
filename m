Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B655A1D5CC9
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789269910; cv=pass; b=KxLOhKa10Sd2/dZmA13v4Szwot/aVq0GISO9ceL36+c2AFIoSmoSjnV0qsWq5cq/9JaTJa1j1WNYsAebZYfh0D2S8HCM5sNsubZgZk/ki6lgDLT2n6+xXk/uWua5Ml0zbV2eGRU8O3rktbf74m+z9EPjKmBe9z5cTG/7qyfRDpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789269910; c=relaxed/simple;
	bh=6nDNbSvI1oAQW6gb33g8D+mLb9dmbyZqIg94bx2Kv9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z7Yfm1pHqaYmGmfrwpir/U0BtT1nyGaJk0w1H8md9xs2zcmUNURWOP+DpaEKFW/o3SIMexa6V/4HOPko+4IGyp0EbkApNNCBlfTCXf4bYV1XwZO5TY1MCe2h64yGxJPW33NpiRdqtptlc0Ye6qlijmJiIYzJRhzNp8b8e597ZLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXkNAqG1; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXkNAqG1"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab201ecso798025d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 20:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789269907; cv=none;
        d=google.com; s=arc-20260327;
        b=JVdi7w699PzJ3AHOv4u1ok9dJTW9rX7K9wUOE/YfC/AzsCRriuBoGWW4As1tGMM4Yq
         9jIAhfXEdV2VIMne2mMxm3OIoQWymhT+2yMtGjZpc8tc3WoSM/vYCXB1ldjEYp6GZGSk
         yHevXanVXM9k88u2PKg/mOerACu2LWEMlbiNy1glPW3Ztd9izb+Yz6F5ZFS37SQJlkqZ
         SiwwpSpDlpIYQHxySkY1gXln9Nh+EAqrUB21f0wezq++vWXzOxPeFd3S9JeyzbSgU7hg
         eq+abwMGpBlD2Wrj9qc795zzLz44oyhxwSNUYm5TBmgO5pNdjBt2ckDdVLtVmzHwtRZE
         zrSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6nDNbSvI1oAQW6gb33g8D+mLb9dmbyZqIg94bx2Kv9Y=;
        fh=2RLGVrpjtH6Zt/RzIZUu3CAAgAaXe954NWSr/dGOzXA=;
        b=D7PpYOAfyENfayzorubscLIP1UQyQ+drSTsMriT7c7YUwF7idSM3etMV2t6JXVnWqo
         wmJrH16TA4Jz4ilTk4nGhYiYz+CeRHP8TVuEeMtKbDFthRCfezMlz2oKRcR0sNajIWjm
         x3GCU2CRyDmSZxC2zSr4LQ+NPJsgmKkN52A/AhFY6Ilmbo529PKP//rdIqyybv+lj0fX
         g/6Pev6V1Xg/35xX7StLEkGrvUqMgpuaNC1/XNDltrVzdfboB5zMBZmIt60e8hIOYpQ+
         yNjJitKmKc3UeJYspSqF7G95T/L+t8wz7AOx1WrBBo0UFur+RPyivgyf5kRsl8T7iYnO
         OEyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789269907; x=1789874707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6nDNbSvI1oAQW6gb33g8D+mLb9dmbyZqIg94bx2Kv9Y=;
        b=JXkNAqG1SNGE6UlN+Mm5apZ8GNahKCvfmOZhPQ2Xe1XpxXio6/jcP1ajRBx5qYvbZK
         +miXjuZS4PJyFWqshl+a/TkOhl71EcBHC8MgFJmQMTAVB6dszPOYgSM83chKUE9Ub3Gt
         /MXP3FSW0kivWOwAHgFXutEyhA+NTV3LXByUD3nnIWra0AFcwvd6G2a9R9fhzashGhW8
         LJ0gqsBCGBQQe7XswlRQtJSUWTGvVuO+ZnhTVTstL9pATtdKmrZMoKFLYWPgtish6S9a
         sXh9rCnorQ3Q+/ty0dDTXlgTI1H8m4Y3NWqdPz26foAKg/UiSzTpKars2J4udbzSVD6X
         0rDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789269907; x=1789874707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6nDNbSvI1oAQW6gb33g8D+mLb9dmbyZqIg94bx2Kv9Y=;
        b=B0wSy3DhDcRA27Ur47i6Mk5NlBAH2eI7vdDSG2LgbG4vGVqjHJehMCrFgWsyEroSwL
         LmstH5BLaQBOWx+GIFSaHl/4dGDW0v1ngOsptydKuhpj5WXLg/TUCnuJpU/Z4oVRxodP
         SYYNxKK5P7/IlQqbgvmEmREtBaOvch5F7KCUTOyfWGhEaKb8mDwLXT/lTrYrN4pkJjAY
         hy1dVgWfuzDFdo5w43WWeFZBtDh2E6e53y8LpCEE+fLn+bSEuAv6djqKBikyI4YvdfpN
         3IS5YSt9p6Vyw6hEHyiaC0J8elRMzAj+W6DvByYiUhbOf3AxpwQTrvzMKnZXGdjBMf+y
         rdJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwh7nl7yF9O3P8pu2HX1ZRcSWIpuTPwDd+pMGzNbXx+pX6zbgubS8RszhtBuz5YlDU1nOhOki5OrzX59t8=@vger.kernel.org
X-Gm-Message-State: AFuF++lSRAAWZG7pUu3ztaskhFaXdyI06nuknPRShxAy7dpvRC8TLlIQ
	wgiHC5bmUe83UcVCx/HQetrO9HWLfbzjpnIXq883otnepZTeAukoohkP4gZr/aa/tU6bBqXRLJw
	20cnq/ZJFaxgvGpejROTcrkx68nqMDwPX7g==
X-Gm-Gg: AYBFou0qMVNygARNPXZh0GVKfB928FpPOYzp7ArDq5RPExhiQxm6yws+oRiOCw7bqP+
	IuliQfazNx5FrdPRxOPxubQlPAFT0jbxfCWGPFGfZ3rQPbr9XYZnhDuH7sjg3OZ3Ydeq1w96fup
	xUuA+WWTGbnOSE07Uo2Wr1KFRuGH2tWFSUd1MDqXNO44cWSorgarULY4udQYYcKUnTEQUixglD/
	MNRCA+/tFsX8nA8HmHqYk7PR2zN32/n33WYiSs5lfvMCfVAM+ny2IhfRlFPAvA+u8RtaFOsf8Ec
	h2Nu7b6QfRD136KDw0wqh0S7/poQcFEyExGC2LPIRHSZxFZzv0gc6FVlWmrnmqUoBTa6U6s0JnU
	bRLIlLBrsNsJVfdAUQWFr54PFe2VAc2mtUQkD49CoxIHi
X-Received: by 2002:a05:690e:13cc:b0:671:27d8:d90c with SMTP id
 956f58d0204a3-67127d8da7bmr2600769d50.30.1789269907560; Sat, 12 Sep 2026
 20:25:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823152648.23136-1-kartikey406@gmail.com> <CADhLXY5uco9Wq8ZmW5UnvGgTrrcLtj+X5Ne+AqaNyyBdKrQ8qg@mail.gmail.com>
 <mty190q3.779eb778-4fb7-41bb-9c12-561cc0980b10@nod.at> <CADhLXY44kq1XamTjXgrfcLc-_HnK3T2b9TVPxjzB4kc0fKdEqQ@mail.gmail.com>
 <mtymovca.dedd95e8-081c-455b-aec6-7abc19484945@nod.at>
In-Reply-To: <mtymovca.dedd95e8-081c-455b-aec6-7abc19484945@nod.at>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 13 Sep 2026 08:54:55 +0530
X-Gm-Features: AcwNN1XiRNbAZtdhi1uNwfykdYWRX_q-o-ZwIZOZBR03b_Yjpbu8sob0aGSORwg
Message-ID: <CADhLXY7otiYPCw+fzzqNWw8P4dPx2xTm+zUeGwc=Lc3tZq=6Fw@mail.gmail.com>
Subject: Re: [PATCH] jffs2: fix double-free of f->target in jffs2_alloc_inode()
To: Richard Weinberger <richard@nod.at>
Cc: dwmw2@infradead.org, kees@kernel.org, viro@zeniv.linux.org.uk, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 10:27=E2=80=AFPM Richard Weinberger <richard@nod.at=
> wrote:
>
> Am Sat, Sep 12, 2026, 10:00 schrieb Deepanshu Kartikey <kartikey406@gmail=
.com>:
> > On Sat, Sep 12, 2026 at 12:28=E2=80=AFPM Richard Weinberger <richard@no=
d.at> wrote:
> > I feel the patch you are pointing at fixes a different kind of issue ?
>
> Well, different symptoms of a common root cause.
>
> Thanks,
> //richard

Totally understood this. But it is good to have a defensive check so that
there is no dangling pointer. It will prevent future [UAF, double free bugs=
].

Thanks

Deepanshu
