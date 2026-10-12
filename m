Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7921A1AF0BB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768763; cv=pass; b=q4Oms3H6rypxIcl9eEuCuM09MZzA6dwB4ZyrCMQFpuYhKMg96ufb1Ak2997vSCrTCrzw6pdWNMY9IKyhHhNXyFUh9k+xTlRqy/Le+z3uy3y+EsFz5SRqcdKpS4b92jDXvSZcMuQTrriU4CGmnXLsU/8nSJPEO1IOebpI2aBnG9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768763; c=relaxed/simple;
	bh=iD1e3KEP3AMbX2eRRt7ptL90vcnRYwFR2RyAi738hw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LWQTPRLbP/gd+s8i/v8GfTbMwuYRzfJIldU7ytVMsmgoxguEihLbp95o9QMnjnFE8FjiVRxtmVGDJ6YqZShwlWXo/Wgo/NjfvJqS0QPtEMblC6bDXuODVb5mcEZM3pz1QQnB1oRmQQJ/GCqGMoR991lgyOHqFsIr1/XHjVBnLQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIam9170; arc=pass smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIam9170"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-49e13495e5cso2471945fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768761; cv=none;
        d=google.com; s=arc-20260327;
        b=p6t/cbpElUkgPkwZ685YqXfhVDfV72CFuAh99ZOkKD+WcuZWO1A9bB3Z9QwCkIgJyE
         loDfJJCq0UXm87nRhxicmH2nD8PDNZ59FM8Qvmmirzqpnu2+hGG6vj09hv2lPRLUwCII
         W1x7GIXftiUY+BcvjUWfdOjFjBoq/+W1JaQxowYooaMBq5Uck5ZDuCO0jHMOScIqlupv
         W3EUso9HPKzh34RCQs1p3KwRI6GoimE5gc3h+SzARZqI7EjoJ3w59nU8J+9NfJrAHTUx
         WAML4R4oCyrqJ0NIUJ0Rt1+2zuHSBq4+FcS0xd41sqj9IfotwXXv7gSGCoXz1wpIZuEI
         /EHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xg5eXxPVCOfP2W1fQuA9+y5+ssRl17yP6bP6c1CGKWE=;
        fh=LY8EnYJcHdrH/zoZrQF1PttcatZs5ku5F3BHPG49jgg=;
        b=gY/g1WrE2nT56a0pYQKjFz5T47BiUkE6xmD1zxF3NxALtkpwfShMA/NyIYRQ7zKbzd
         3rM3njFlBisRaT19/zS6/m1kSLjHQDQh+nDhCveRMQ7krL8cA4TJihyfV/JRpXJDcPxw
         j2UsTBGVuM8EDeQigz30ZnaQ3oNlvW9Db9rqNnWBR+5acSAe5ESX/OzRpoQkJT19id81
         wNeJ8uX8abrREmqYfUNDDV+z+/1lVdj8dynWqIEKWTqJhU48Y8MC/YTcQxLj/jJ2Vkul
         DDYGtfgNrfWn7ksErJw1x3MzkH4RVrkthySGIcNfbPXDtwu8CTN81nvNb3EBgMpJ8n7G
         0cCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768761; x=1792373561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xg5eXxPVCOfP2W1fQuA9+y5+ssRl17yP6bP6c1CGKWE=;
        b=JIam9170K0mpyHgyKbY5oyjDQtW6eOUfZbsYSJh+WizflM10iW62QqinEzHCvWUOPy
         QB5K9SOF6vsaym6QAs3fgbSqiLUTSbwMChsd41OnMj/AeweMsKT5KN8inSE7XQB36DoS
         BNyeMOECGBKLO3ZjcglBIxG1sXjfGaGwDearLZHypl3KoQVD0Z6RbjO2u7atKMj3JWgF
         NB0i6bzuNZa8HNqTMIthjJwMRiQFaGiS8185W46ls19K9o2dxId8SciT+NOxLw7QlPm1
         ZcfpY+37eOE6NGmQEH2biiihRNKoZu/xpr0yzhuaIe4C48PmphAZ9TdLODqBK0d0YlH7
         BTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768761; x=1792373561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xg5eXxPVCOfP2W1fQuA9+y5+ssRl17yP6bP6c1CGKWE=;
        b=q2Kl7djCpgHqL8fxzxsSq0r54lqMm4zRt8BdoUW22toDzOgC1k5XiRkRBAs7PRfWfe
         pG9pDCbtaTd1Bvu6stVHbCKE/mwP4f42hYZRf8NZiiO+ap5wdd39UqcAjqCyfN1EZ+8n
         VBks4TW721o30rKsFh5KDeq4vd71uboP1sTy7hN0r1KAKv+wyeE17pxPW660KkAlcI3e
         Fuug/dT2QFhe1rc1Cnd6a+LGeAsUZLj/QHQmESpUXLhIyaBkOgRapFKAqZmcZSHz259z
         8evX/RwoTRBeMAHspUCOAZmPnT5fcy61gk4chPikBknot+PFylC4EcqrDGr51RddKujq
         lJYA==
X-Forwarded-Encrypted: i=1; AKwUvBxQqZCRqHv3fPFsolRj29vyR/1dYcAMX2bFipmswzuAaHR9q/eOjbZa14JVGXYLr7dtZJ5KmQHDgomiBOo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1Vl0thHPMTDh3RgCB53aiq8OW4IIDqKsKLOMd0ZvxIQf8MyVq
	sAvzDxd+5AAUN1exkqdmkVa7M0TQuK+bQNHIdrnZX4far+6W1kdwTmTTpxICD6HXCA6Qnbzd5I7
	Nimu0QtNd4Cleg/jHi4S6fSfVIKR+arg=
X-Gm-Gg: AYBFou1qkdkNK1CuLrh2HPW0PET7JIzRSepSZ+i47Ahbk8keioIpLyEBPGP/dtHysd5
	cPR/7OUzRyEQGWdRo7/RmiFo8XkdLI693B6sU/uLWQLT0SZlBPXNT2GeNYRP3irpMKUSmD0PvZA
	U5TjoTekU4FfJW7hhBRTIQsrwAx2utCHDg+Zsnsb4Ofnq/tQDo2pMC/1UF81mR93Pe//GPLNKR/
	ubgtkJm8rO/u2RElZlp4L9GsPXXEl/nY94GGZ8t0dgpmt05dIlomRl0HZvANOWsOAGIr0Rwf4Fk
	Mli2G/vDJsZsj0NukC8anFSU0TrjlIi3coN/nXANTYtnQC5HWyG2ung=
X-Received: by 2002:a05:6871:3841:b0:49e:404f:5f21 with SMTP id
 586e51a60fabf-4a2a89d1db1mr5274092fac.12.1791768761487; Sun, 11 Oct 2026
 18:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-b4-mbox_double_unregister_fix-v2-0-cd5739b60718@oss.qualcomm.com>
In-Reply-To: <20261006-b4-mbox_double_unregister_fix-v2-0-cd5739b60718@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:32:29 -0500
X-Gm-Features: AclHuK9TFyJC0nw2fQpH9Y6YLn7Y_Y3tLTVWgLwXQneH_ywV-6sddXTE5ZUfZT8
Message-ID: <CABb+yY0G=ubsGQ2_AzM=5LAZW7xSucVMZbt8xd0GMELG7xQDGw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mailbox: Remove redundant mbox_controller_unregister()
 on probe failure
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Huang Yiwei <quic_hyiwei@quicinc.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 5:59=E2=80=AFAM Anup Vishwakarma
<anup.vishwakarma@oss.qualcomm.com> wrote:
>
> Changes in v2:
> - Remove now-empty err_req_irq: label in qcom-ipcc.c (patch 1/2)
> - Restore original alignment of devm_request_threaded_irq() arguments
>   in arm_mhu_db.c (patch 2/2)
>
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---
> Changes in v2:
> - Link to v1: https://patch.msgid.link/20261006-b4-mbox_double_unregister=
_fix-v1-0-9011ca208d36@oss.qualcomm.com
>
> To: Manivannan Sadhasivam <mani@kernel.org>
> To: Jassi Brar <jassisinghbrar@gmail.com>
> To: Huang Yiwei <quic_hyiwei@quicinc.com>
> To: Sudeep Holla <sudeep.holla@kernel.org>
> Cc: Jassi Brar <jaswinder.singh@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
>
> ---
> Anup Vishwakarma (2):
>       mailbox: qcom-ipcc: Remove redundant mbox_controller_unregister() o=
n probe failure
>       mailbox: arm_mhu_db: Remove redundant mbox_controller_unregister() =
on probe failure
>
>  drivers/mailbox/arm_mhu_db.c | 4 +---
>  drivers/mailbox/qcom-ipcc.c  | 5 +----
>  2 files changed, 2 insertions(+), 7 deletions(-)
> ---
> base-commit: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
> change-id: 20261006-b4-mbox_double_unregister_fix-42d5057d3ad5
>
> Best regards,
> --
> Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
>
Applied to mailbox/for-next

Thanks
Jassi
