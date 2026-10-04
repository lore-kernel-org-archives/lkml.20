Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF0C43BDBD
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791115152; cv=pass; b=GZPqI/ckv1P7A6UDqk73ZuO5h72GqlC7hCo7HSGGfpDqWKLma2xvXW2WuBb4pCYr6eaGLPtCvuMg5Cq8APOsTtqq8PolgdbJl1aXCBXBfsZALGcwh+Ixqi+fbNrH6XPxrLXRp8dcUr+axiRtmUEO3WSPNvdpol4fa0oK7p3Qx/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791115152; c=relaxed/simple;
	bh=YvGJiLLSGEag8VAXDiCkjwNnc51Pcejq5U71ONdSTxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLfbbR5R5WN0LKD7xSJE7PWPy0WkU9t/+lZ4eqmQF4Dz+j5E+4QrLqKfFIlbCpsLy2CALmJwYS1p53Uw8BS+vfXAvK6hQ1otC39t86r1YxZt6dHjfg2b+kqBYp7R3m9NoRiewU99uDrG6PfWl6DyNdbXCHN6EZw1u+6iY5AqPGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqMLGH3p; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqMLGH3p"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba42966d5fso693589e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 04:59:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791115149; cv=none;
        d=google.com; s=arc-20260327;
        b=Cwak8R4nhQYBh3fKSfK766hmCnU8XD0bjK9w5F1XoohnuOKfFvXORgk2qjwMDz0sQA
         f72K3meLW1z2tW5T8B2JoQDeQjD2LjXs84l6nuCE8E8FbkjEYLdfQHzPADopbUxOuIb9
         lZr2+VgyYts+QcnayybcYaL1KhRf8nSMmAmDiJX2Y9UDoQOF/WBQ7uxkgoWvlmdEImOv
         uw/sjvbi9iL84KbGzCWkNgiMdHCILz/hPnXjNUWftoaitLpgpaJU93cpXzWvaTmiki8K
         Av7zqaH9PDXZddXs24+gTixyVZcCgFxNKSepgyP+eR96Hl986vG0WjuMgiKoL8Ie/DdZ
         u16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YvGJiLLSGEag8VAXDiCkjwNnc51Pcejq5U71ONdSTxw=;
        fh=3CQwUfxDhXh1y+I4DXSDd7L7jjqIaiJFYp/SPB1X8C0=;
        b=FpFngD2VxIc7icfd+fR3o3flejwxaSDAjOwW9uinxVHhh44uFlbrRpzfBkQ26OS7Oc
         CAKSW2K9kQKnDEKDOBnvihzXn6MF0X6Mobt9sQ9lc34Z5H5ejc4KrPbv+iIEv8uaF7qI
         jhLe9ehzOTCu/rK3+npDyS0Er7iDCvkLagPE7JTvea2j6OR305UXtyq6qFKfp0ZLpFhX
         kh67jQ6Dku20VeBnQbd27zr1ICTQqUAD4Z7pBELPp6QBufOhJE0cm7lBUoiQgUcqUmmw
         bqo5punpEjaWvdIrFvXUcnKRzFmdCX0N65+M2easxyPa+lJkAUZllyms23sWCawV1CB/
         DArA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791115149; x=1791719949; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YvGJiLLSGEag8VAXDiCkjwNnc51Pcejq5U71ONdSTxw=;
        b=VqMLGH3pwV5hY7J2/iWBbwzoGS6jiCnk7KAk6ke0Y5Pbrt6TuydcD9N4g2hrXLiZeH
         nfqcTfyvgbmZBqPRYMm1CrrLcaIfG7CkPST1xEi4FPj1oeTPUkYeJu/O5Zgm6sw7oHXO
         KF3o+/3OSdPKbPOmCaRirw+/mfU4t87U+nIUcSGRHpM/cToqQHKsl7Dkh6MsqYt89gEj
         RBMvD9gosXW83TSojA1gmJ+AUPGq2lQ4g+HWct0/fzC0fm9DXy7lE/t+n+Mq1xnDFZjr
         E0pWQZzloJ5S74WqosP0opk/LVMUy6mA9UQlPVnIIuZfghh0N4ByKelCKkoYTomRoR4/
         /ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791115149; x=1791719949;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YvGJiLLSGEag8VAXDiCkjwNnc51Pcejq5U71ONdSTxw=;
        b=SikqeFz4a8oESTzBEMyN4cdyn7VC85AaAw9teCzkDo8qjoEj1BrY4fN+xOH2CTyZ9V
         m/0/Cgbc9ytqTECl0hbsHPLeikZvj16KWQIY6s/ZjCOB3HuIYd+iFTw1/D7Psl+csm6i
         2u+6JY4875WhS0ZFio1yd/BJfNae0QQAt5+plVAiW+HBb/SsoCaWHPz31/VdOnDXqJ68
         NqeD2Vfde9o5gYL8Dul02BVyKGD9/BdjF6WqQZNuQWXsHThrktpweE8njZagfyykCvk6
         tJjpkfhfLCNnKNTrawJTN0umBqR/WLM7LNq1PhG62KfK42SQeVEIjH1ik/FoTJMVlZIF
         7nWg==
X-Forwarded-Encrypted: i=1; AKwUvBzI0X4NoqPDXc/Ns5snAeLBgLHuDuhvYWb+Vl3DzKpZycCGSxpVXkKb/qFPHVtNpBtfO+IdLEGDCoxEsBY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtV94+Xrp4ZA3Kb7kDk1ffOQ00MJilsFWATOp95rn0x1qJdCeu
	00Vqiynb/u6/+dOozj7zyJQ+4fpja5oEa17FAqv+7kYM25MzHZYcVlkuow1Xfh0+GmeFs6G0Vi5
	FBW1t9DYaTgVl2d3q8nVJ9SeM+aT/aCw=
X-Gm-Gg: AYBFou16hf6MYyw/ZrvJNX/KyKcuTVl3P6vwzIWcf6YzF4UQC1kwM2/84b5SqOj1jLI
	yACLPyZ06BcGzBzGb5850Z72p7QQUEPYXRXcuHBkZ4P2EDjirzns4mgW987POoJ/kKRfSM6qkwC
	/tWPRG5t6CajCuteOEb2aWg5C5r2oEtVkgKkwF9xwefxcdMFvxCrOzbxqWxdUNVaNeJKfNoZAWX
	wq0fjzFpe5AGIaw+lxzcgmU1UILrYw/vdODjjBK7fneoeRRhGROBgHpe4oOaJtcX4tHPIjqlRPm
	iXeeS00VXK7+1jQ3LhVDcvh6Mc27+GBlfHPCL6XL5KTPCZH2u5kfsiEoPA==
X-Received: by 2002:a05:6512:3c84:b0:5bc:b8d8:d766 with SMTP id
 2adb3069b0e04-5bcb8d8d985mr953656e87.16.1791115148823; Sun, 04 Oct 2026
 04:59:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-qcom-smbx-chg-state-change-v1-0-fffaef446932@gmail.com>
 <20261003-qcom-smbx-chg-state-change-v1-1-fffaef446932@gmail.com> <20261004-jovial-fancy-ammonite-f9fd1d@quoll>
In-Reply-To: <20261004-jovial-fancy-ammonite-f9fd1d@quoll>
From: Fabricio Akio <fabricioakio@gmail.com>
Date: Sun, 4 Oct 2026 08:58:31 -0300
X-Gm-Features: AclHuK8XfUMsTrUjezp37dJXnfrGVlkqDXrTvYsOblQTNjNZvnfYIKp_Sma2dwU
Message-ID: <CANxzQdE8tmPLweN+gfs4DdpFJXpL7ruiyk1cwNA41TL8NbefCQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: power: supply: qcom,pmi8998-charger: add chg-state-change
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Casey Connolly <casey.connolly@linaro.org>, Sebastian Reichel <sre@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Robin Snyders <robin@snyders.xyz>, 
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org, 
	Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 04, 2026 at 10:06:52AM +0200, Krzysztof Kozlowski wrote:
> On Sat, Oct 03, 2026 at 04:45:21PM -0300, Fabricio Akio wrote:
> > The charger raises an interrupt when its charging state changes. Allow
>
> Each of the ones mentioned in the binding?

Yes, both. PMI8998 and PM660 have it as interrupt 1 of the charger
peripheral at 0x1000, as the downstream msm-pmi8998.dtsi and
msm-pm660.dtsi describe.
