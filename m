Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4024FDE77
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677393; cv=pass; b=jmMB3YqA/x3kTdA59qph5QTIpDhi30XrIEquXt1X/KiTbBvQbbvaijGprVXVCwVdm9F2oYv4IArUS5pEg++uRNyIrs1/L+6zAhR4WEEDd0PyOIS4cort8MTVSeHjWhRDwRzWSXCX4Ckw8f3Qs0JpdpIH3IH6/UavqzM+x7t4uxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677393; c=relaxed/simple;
	bh=5yvYIcCf7rI8QVQ8cPIbS4698MdCz9hYgzlxspOV094=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SUuWai5WF+sXe7xW3X6zPm3aoRmHL57cTYRy01vmRXscRmlyGnLXHKrHdsuME3xWDH4rRm6f3+oJHekhiIN6qcAyhhkDxjhoiyoF6siI2i8IJ2CqK1OAOiqZ8ad+pbWHzLVzv8sRy0uHrJJDxVEwG0ksNG01kY5rzolJGfvJgyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7fAtBQc; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7fAtBQc"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so1754484a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:23:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790677390; cv=none;
        d=google.com; s=arc-20260327;
        b=XuXnR7JQGpl4dUqwRBWFJABnjkAw9f7uhD6MPsrUhytf20Uu59hEkP/ApT4JHaVa8j
         PjZcXbcQPiQXQa1Tdl2H7xBwMTWpyIZ49Iu8I9wbor+HOWY4fLCC1RRHWHpyc4mFKMiK
         lyMi/pTR2FkDDa3nPlFMyPhH3dF/ccYRy8yxYGTtZvbJpGrpfFgq4SDDT2JcSwkHSukD
         TxIWAnXwT0+RHje+9UCjb48FYupK/qeuZUd/csnC/bANz6P/AQRrT2apB8ZTVACe2yzH
         zItYPXi6Xin0oqWEXz5y6ZWX7wpQI2jjsAxwvoeYpmwOQk9Z4ZuxGTYKb72Q0v/NQr/G
         7B5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3sDqKn5ySRU084yOTBxE8fO8xb+zYKz0ZWYKX2x8q9Q=;
        fh=oMwOC4RTNC6/NbwuiOofG96iKUQ9hG3u7mUtWuImDNk=;
        b=YK6cNiN8npqANI0oYfS08eLc3dgNcWbbYHMmy0JGQ4EazCfr0AnZ1AsUZW2BvDn/OH
         je3bFjCrMJQwT4waIsvLzFVMK+nH0oBFxxBi75FblIIe+C3X7rASQOTrfrwcPsQFtn3D
         KgVVjn89Y1yzzjcEcZKnp1fpbQOALkBT9CdKrbBkcxea6DVIR6FthhqK76RJe+m2K3RC
         DibXgYrKEMx6+KHDCKuxhhvzI+E+dya6LtU7d85ZQb9eln4PTGiR/SfNS4AiWLk1xHXw
         GOqQqr6uPaViJgeJ4dS0JsVOLn1C3j2fm+HG06PNKupvzxu/VL8gW5gicMHYbRKAaEDL
         rlkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790677390; x=1791282190; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sDqKn5ySRU084yOTBxE8fO8xb+zYKz0ZWYKX2x8q9Q=;
        b=Y7fAtBQcpEJwhYi2DhYwiOVfPOIN/LogLSKuwSq8CL2EGr8wx55Ipcu6qPAH4tHfcv
         pPNdLR83yvAXH/mYdvgKH1mc2i9OcpEX/wkJF/jKU5ZLlZOQ9fdUzg8tS8Og7XjPaHmv
         8+ayczraCNp4yAl8qZwYPUMgGhEi9YNaeGlImjP+d9VP8TbUqPvdW0zBiq3zMfM/RzPf
         cfRUmnBWljZIw/ownnlU9uarYxdIpyMG71uJXI58chENQ8zJL6BTgBTX3drkgymcHK0P
         GG3klwXOaiOiHijSXHvhGiIuxt10rD4mPqqkMm0DHgFNWWeav9d1JL+qxQzteyCh22zz
         K9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677390; x=1791282190;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3sDqKn5ySRU084yOTBxE8fO8xb+zYKz0ZWYKX2x8q9Q=;
        b=mbqJ8gAa3F131CnK4+jt1ObjqozEopUkMOavFcUZ11DURrF4Zs73MDU+wkPXiqSVlf
         WHB3qqVUGHP23As90vcoTsvopBaEvUh0KbxPvCPlIrYQ8hxNGtDJk33LO7eQpELUKYOS
         5Y4IBZA1jH2ybcB5TyqeljRoieBWF/U9lqFJNFPU+bqk1daNbevOGvaI5eE7I87do+wr
         rnx5WbyNFXKoR3jtOZ1Eme8PGoZA5GV5DpdCD6LhKZh3E73QbEyDZ0fLb2MicI5Z0/4c
         upr1oey9K00XiPegpoTg0JWp82FlqDzCpv9gmoZB3UJ+4aUddIPfv+vTfHBVF46AXuSE
         k29g==
X-Forwarded-Encrypted: i=1; AKwUvBylqmEe4fuO+msxM2ZUGoKtgzV9LtZ80FesTL/H5H5tlVeErTwj4OJeYO4y9X6+hF/xqzmLkmBzIYToJIs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrYK2Z8ZWg5JShw9Lg4ZPA3dEn5sWa807d3voNEyAfTo2bvo0b
	ktQAbKM/0ExTMah+7NLxiOJSo1KFqL82LmG5gtQwOXXFRZSCK/ZrSoRV+RKsCJhbRq93YrTCbn3
	f+fJu2O8pqGQnkQluTxM4tNR/irqjEhJkdxj1huc=
X-Gm-Gg: AYBFou27OSqHufew3ylMktQKKQoIeq2Vs4QddWz6oOyOqf1rGPbqAAzwLt1Ik2UzO0S
	m/RZbBFauHynY2S5Ix6tPJy3pQg8ccwfdYtcRkNqy1j4neqF3bUTW34f1z2LL1Wq3TE51/Y2V21
	/j4SkCE142F+xE6doCwzfW88/9BkdbrGv9r+tH/ovFDZnbJpJJK9tilKwQUZVmgbL2VQMXMUDMP
	90z4mkIc4cFGnhEXWE25UDbWrsmQGK+bd4NoM693HJkH4X7WKSgy9UBQMwmsOSBIbuvUjTD9Rhu
	udZFyg8ZIZw004Rhum43MpvCTsUCTe+gEAyfZWT4PX+dMQ61msyah3NNueHw+KS8qdbvV9EC7Mb
	sm2V70LpwmuJLHWSyZGjEwzoEYkwyuVOwP6vqGtOOPNV88NCedDbZaSaZ3JWDIt3uLdra5yr8QR
	2t2w7Ld2qeKvT8uVYO+DuTCg==
X-Received: by 2002:a17:90b:2884:b0:3a4:b1fa:7235 with SMTP id
 98e67ed59e1d1-3a4b1fa79b8mr141852a91.65.1790677390435; Tue, 29 Sep 2026
 03:23:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920184148.31541-1-mstoretv@cern.ch>
In-Reply-To: <20260920184148.31541-1-mstoretv@cern.ch>
From: Antheas Kapenekakis <kapenekakis@gmail.com>
Date: Tue, 29 Sep 2026 12:22:59 +0200
X-Gm-Features: AclHuK9_Gwlmf3ZnDmAE_IUdVkrv2ME6zV4G41dDg_SEHlLGligGKipP2rOV9RY
Message-ID: <CAGwozwG_pR-bsEnk60=-7sxXcQm=YP0rV51hvG5ZTVtEpDYErw@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] Add initial DTS for Samsung Galaxy Book4 Edge
To: Maxim Storetvedt <mstoretv@cern.ch>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, marcus@nazgul.ch, marijn.suijten@somainline.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, abel.vesa@linaro.org, 
	abel.vesa@oss.qualcomm.com, johan@kernel.org, konradybcio@kernel.org, 
	kirill@korins.ky
Content-Type: text/plain; charset="UTF-8"

On Sun, 20 Sept 2026 at 20:41, Maxim Storetvedt <mstoretv@cern.ch> wrote:
>
> This patch introduces devicetrees to support the hamoa Samsung Galaxy Book4
> Edge, and includes the X1E80100 14-inch SKU and X1E84100 16-inch SKU.
>
> It continues the earlier patch series started by Marcus Glocker, and the
> previously submitted v6 [1].
>
> Supported:
> - Keyboard
> - Touchpad
> - USB type-c

On the next revision, specify that USB type A is fully supported (16
in) and Type C is supported as initialized by UEFI only

> - Display

Consider fixing the Touchscreen too. If I recall the goodix driver
works as is. At least on my device. Update the dbt. You may reference
my oot dbt for this.

I will add my reviewed-by/tested-by on the final revision and that's
enough for me. You don't need to give me more credit than that.

Best,
Antheas

> - HDMI
> - WiFi
> - Bluetooth
> - ADSP / CDSP
> - GPU
> - UFS
> - Suspend
>
> Other features (such as the camera and touchscreen) are also confirmed working,
> but for now need multiple patches/changes out of scope for this submission.
> These are tracked downstream in the meantime [2].
>
> Changed from v6:
> - Updated to match current linux-next
> - Use 14 inch SKU as base for the dtsi
>
> Changed from v5:
> - Reworked DTS/DTSI for both 14- & 16-inch SKUs
> - Added Galaxy Book4 Edge to QSEECOM
> - Removed UFS node from the patch
>
> Changed from v4:
> * Fix previously missed commits:
> - Improved commit messages.
> - Added missing clock line for ufs.
> - Removed invalid microamp lines for ufs.
>
> Changed from v3:
> - Improved commit messages.
> - Added missing clock line for ufs.
> - Removed invalid microamp lines for ufs.
>
> Changed from v2:
> - Squash Makefile patch to new DTS file patch.
>
> Changed from v1:
> - Provide the patch in the expected format.
> - Added missing bindings.
> - Removed sound node.
> - Changed regulator syntax to be consistent.
> - Changed touchscreen node comment, and removed false pin definition.
> - Rename ufshc@ to ufs@.
>
> [1] https://lore.kernel.org/all/20260322160317.424797-1-mstoretv@cern.ch/
> [2] https://github.com/zensanp/linux-book4-edge/
>
> Maxim Storetvedt (3):
>   dt-bindings: arm: Add Samsung Galaxy Book4 Edge
>   firmware: qcom: scm: Allow QSEECOM on the Samsung Galaxy Book4 Edge
>   arm64: dts: qcom: Add hamoa Samsung Galaxy Book4 Edge devicetrees
>
>  .../devicetree/bindings/arm/qcom.yaml         |    7 +
>  arch/arm64/boot/dts/qcom/Makefile             |    2 +
>  .../qcom/x1-samsung-galaxy-book4-edge.dtsi    | 1537 +++++++++++++++++
>  .../x1e80100-samsung-galaxy-book4-edge-14.dts |   28 +
>  .../x1e84100-samsung-galaxy-book4-edge-16.dts |   31 +
>  drivers/firmware/qcom/qcom_scm.c              |    1 +
>  6 files changed, 1606 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge-14.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e84100-samsung-galaxy-book4-edge-16.dts
>
>
> base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
> --
> 2.43.0
>
