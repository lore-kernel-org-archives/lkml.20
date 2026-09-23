Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5475831F9B4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134629; cv=pass; b=Ifjg9OGdJ4t0fUGCx5hEeKcxirxqPI6Q7VIuSvVrLKMtZIN1EK0zvedWwRaZ+wZ7WzZcwGyKC2WvDT0X9zm6ZkFraNc/i3SdCUN1y74eNsdVQPzyjgagb1Cm6qdJ6UTlP+fkxKHd/jGnIeYGrCYycu7zk1rrcvvMEgJuxzQqULA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134629; c=relaxed/simple;
	bh=yfqpp8WYOenmjb3oYHuHBnzp/XrvWdHp+mrIFBFp1P0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jRULOJIH2dr23am87fHygI6ZS/byIEJ26I5NZJimvOs58lTNbccSuHwFuD1L90N8bBUX35MekDlmKGbnXX73ltJAhrtXOYXnU796ektBoMtI9vnUTtjc7f3/1YhaozkzRqbtCplUQCTIyRVL7dZia2roiSnBCkJ+82546q5+jts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDIBoSoj; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDIBoSoj"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aae3149so398024d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:37:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790134627; cv=none;
        d=google.com; s=arc-20260327;
        b=pLt++9xu/cEizbJgnLdV9z1KRGCTxV3eImyQr7OQT68D4r6hNPcQIrczmzL6Mp2LSI
         xRnxnYta5fe8dLm/SUfb9fTyquL1pwhgeCu2kNVMPVcAVPkWjZNqzNLKG3soAScXswQb
         chRDveh/QpzBnnbNeUe0P8Qd8IHUaF9zF+cRvm/wOlBREiyaJkMm/sw8WoI7tGh5SX3q
         TFqkUuxUKJMaxnicuPHbOPXrjRJFzmLMfgSFRhZYUlOp2j6fhVlbYcpuoob7x0m++tE+
         RmFW2OlCeY4E+nkqd0VtT8gdsVch3ubhaF5MWtZGPdGsw6dtB+WFONzWeYS54SKn7NQo
         V11w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+ZFmROfgidpQl1un31xXH76vvuzAN+m1uLmNu7y+jkk=;
        fh=uii97lCIS2fQNK8Dg0H9TTdEKd5mdyMmuOEBEF5ZS9o=;
        b=sATdcxVlLCgtvu012yosDXgU6XtSq/MPiBfW113UPZReANlxUG8G+0dD/E/Nj7R60M
         aGUKsE6X4Br7Q7I+CvBsXtiDUJKJuSrowO3GtmPuDpT2zmpOL7x7p8UTw9mr4AzB0T81
         v0RZ7B9t2e2569p3dHDFh2yktPoWfdwz9YsVRuWdLuSsfUxjt1QTQRiRoTfsSv1xlB2p
         5dS35YTBWfb+kiBWSmuVuj+iLZvzP+iSlRAeZ1IniroXZXYkLIMMxOkIiLiR+VOZTRy6
         WpohuQxMKECSb+82K04KLJnTmS38KIEqocYYcbFtomye1tg0e1iich/veLqYH56933AY
         8JnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790134627; x=1790739427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ZFmROfgidpQl1un31xXH76vvuzAN+m1uLmNu7y+jkk=;
        b=eDIBoSojFqTGVFJSfpyI+dgrVgJ+kbpRm8SU7quzy3mtWIaJZUcTEArA5PiD0OXPtA
         qM3yyS8ekPeyyl96ZoemqcL3PX6cxDYD2orEt4+EwXzzZM3LVWyO9xzWPULcGLbMPrK7
         MVf04tgbehhhT2EkzHQx8jbsHEGOIeDqXxD4dRaMtK4SuZwd+pew/FM05mGmdkbYizSe
         TIAp+6/Qlvuuqd9MeFq8ZK53c5a2GPdJH80phkvoV/0FwJt9No1jzw+FqBT6F2iABMW8
         Sie1Db2lZxDLs5f7uLQt9KV2Poc7X/qJelP/4vqatL81y1r9M74FE7ZYT6fITAQMnUN0
         jqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134627; x=1790739427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZFmROfgidpQl1un31xXH76vvuzAN+m1uLmNu7y+jkk=;
        b=qt3HBvhOhAXGshCz/VOdYRFbRpQvqO3hl1cyKw3i4EG/a2NOr7oGjsK9teFbpD4M1+
         G17I6ZKMzCN3KiQd3etkNLT4aoXy5q0N5eIuqAHf+PthjeohQLXyRMS1M4QzT6ThMj2Y
         VVOtkLhgg6qXb6gT1XUnIadsnTljqVz057A+5I820v2lyPL0icS8PJFStT6Hsn8mIZDy
         SLKBO3K7DXRATCpey1jFrmYTDj/ajiqOTJsG3J1k7GOrt0hW1C5jD5DkjWpk7miJBnC4
         tXdTKQytXgasbMeKK9rcfuWQFz87OoudJingvlxQ9yFXTBQoK/YSSmOmlgktj8B15ZIz
         F9wg==
X-Forwarded-Encrypted: i=1; AKwUvBwd4GVQuw1Czg/FuvtgRWkEagQhSEcWAf+563qtErdAITv1BfLACSfBXlRmRJd7yhWp4QVS4iH5YOHqCIQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mRGrbokvG0Tc9wT1mIKUnho5vb5NPmDABkUFGeF4q2mclkhf36
	IbG5r0i6Q6NFiKd8NT0NPVUaLExQXlbme7JS6UInQ7qQcIC77yrKRAkvD89FbM2E4NRlbMhKBNR
	NLONVmWK2i9VmxqOwnRJEM9X3yVO9voQ=
X-Gm-Gg: AYBFou04G0v/c/9e+h9p0km2BXPl+aji+wgIPHRxYzgHA2JyMDawDI+VEi4fFIr1dVL
	1Pfv8485Jr98dkys8RHxpHvdT6dxkVAc/JNj9K7eQR8poCOlsCeQPbRZ6nUTWr/TbvFv6bZIwUy
	ygItUiPOGwBUGmo7U14sL+Qu0NOqxRNI6B2V7NBrk1I2vO597QtF0Ea3MXBrv2svW/sPEDYShPj
	H9dxmZiiplCoXS7OZXr5H1d9cqOEhalgPHkFmGNHV0e9PDnSBOPW8kq87UMKy8rU3rjuUbzbCbI
	xzOz9j5i0eREJ+IDSOr9mO9hxBUYZbeFy5eIP12FzloYwkLGRPI95qgQN55jXJlWJuEB++fimwk
	giafs/4jplx+jwok6JRgCVdHyadfb3IU0MK5ACIiMMsW4nfhRbGxhmQ==
X-Received: by 2002:a05:690e:813:20b0:66f:7d56:cf77 with SMTP id
 956f58d0204a3-672d578ffd7mr617427d50.26.1790134627332; Tue, 22 Sep 2026
 20:37:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806080018.10050-1-kartikey406@gmail.com>
In-Reply-To: <20260806080018.10050-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 23 Sep 2026 09:06:55 +0530
X-Gm-Features: AcwNN1UgAdWRW0CPTd0_d3jSSC0DEL0l0d8D5ZdtmqlAgKIGlSvpt7WCNa3r8tk
Message-ID: <CADhLXY4_jL0b5P+7_vHBdkGeNRAYJN4MFEPSoV2fyMdAKHWAHQ@mail.gmail.com>
Subject: Re: [PATCH] Input: sur40 - fix use-after-free in sur40_open()
To: dmitry.torokhov@gmail.com
Cc: kees@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+683f6c071b5abfc266c1@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 1:30=E2=80=AFPM Deepanshu Kartikey <kartikey406@gmai=
l.com> wrote:
>
> If any of the registration steps after input_register_device() fail
> (v4l2_device_register(), vb2_queue_init(), ctrl handler setup,
> video_register_device()), the error path frees sur40 via
> input_free_device() + kfree() without ever calling
> input_unregister_device(). Since the input device was already
> registered, it remains live and openable, so a racing open() (e.g.
> from udevd) can dereference the freed sur40 via sur40_open().
>
> Split the unwind so that once input_register_device() has succeeded,
> the failure path properly calls input_unregister_device() before
> freeing sur40 and its buffer.
>
> Fixes: 08b936012964 ("Input: sur40 - switch to using polled mode of input=
 devices")
> Reported-by: syzbot+683f6c071b5abfc266c1@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D683f6c071b5abfc266c1
> Tested-by: syzbot+683f6c071b5abfc266c1@syzkaller.appspotmail.com
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/input/touchscreen/sur40.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscree=
n/sur40.c
> index fe63d53d56db..b0958422ff76 100644
> --- a/drivers/input/touchscreen/sur40.c
> +++ b/drivers/input/touchscreen/sur40.c
> @@ -808,6 +808,10 @@ static int sur40_probe(struct usb_interface *interfa=
ce,
>         video_unregister_device(&sur40->vdev);
>  err_unreg_v4l2:
>         v4l2_device_unregister(&sur40->v4l2);
> +       input_unregister_device(input);
> +       kfree(sur40->bulk_in_buffer);
> +       kfree(sur40);
> +       return error;
>  err_free_buffer:
>         kfree(sur40->bulk_in_buffer);
>  err_free_input:
> --
> 2.34.1
>

Gentle Reminder. Please let me know the status of this patch.

Thanks

Deepanshu
