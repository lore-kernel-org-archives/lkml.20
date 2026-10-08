Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6942483BF9
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452161; cv=none; b=a6KY20nvGcp4cMkL1X570KhrqPnOjKbv44BprzWwxjp60SsVAgYzJFrzrOkyVDDGFhQ7kdU3aGluLlpVSuT1HgB8yOYH7jF6/m6M+xv3M+xHqPhm2Z1YfS67cqvOB2JU6Oig/mQO0VdwuMCesJWa05mHl7flagSbmqzsMiYCEnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452161; c=relaxed/simple;
	bh=Q6yoOCjp0fhR/Tr3y3/AcnjuHfDKPtqiogFuPdMKB5o=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nLt3uiAhPki0iIi74fRjED9NAvr3UgREBgxmnledytHOps4Xa1mwkalCDde1tEPgkku1MeO+whuWk5H9pEcWAnXtyK1dGcS/cfVZFWCPkQjih8m9s2IiTsEE+h0/EGVmBHud0MpJDzuBIxQiDk2j1RJI5ITw3RKPrbqrO5qEdQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eP+222QP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eP+222QP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479841F0089E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791452157;
	bh=Q6yoOCjp0fhR/Tr3y3/AcnjuHfDKPtqiogFuPdMKB5o=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=eP+222QPhlXJBpUZGyfHb6xUfVvosQHP7wtDU7aFbYfD7tMYkD/HqMdWKYkNC54PQ
	 WtZjeGZR2P68CDzAJdFoAaNnDOD+m6gasIoVbfV+hSsUZVpcAZ3CJw22gUWwZwUzqy
	 L4/3z2zDod2QPt4L5anXu/N5FOQrvAr+x9pprhTPXrnUMiX2Wr+Sv0N1A9Ml7GwSLj
	 Qx53VWMm2oflvOyS19uZpQS1929rR5i4FtAszCbU2O1jagqFnHyYsWpxbYZvr4LoO/
	 onKeyjeFGXL+xUiF6Dlp49zNsQpLGxqavFZNNpJWXdtCnO5oorJFBozr2Pp63JeFY6
	 xlJKwOB6oc/Qg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a9787a15bdso22294731fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:35:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzVTYRKXmwoCFagFIyzZeHPv2o1U0+Nx5hBjgFJUa2FhPn4j8bTOS67f0E7xVnVphOP7k/2JlAqUYxuQ+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxYEDhXkPMYyDBviQi45bBz5pLT3BKi4ssvp3jWl0tACxNb11P
	suYauGIC7m0UX+47QBqDW0xLQFDnoMXxo651egRWb2S1xOt6CwjMzs3Sjw54rL5gW5QDmaaq23r
	b749rPH199IWiafnEgNSjbAqb0WQkvU0EKD5YkTSj0w==
X-Received: by 2002:a2e:a7ca:0:b0:3a6:6efb:a0e1 with SMTP id
 38308e7fff4ca-3a9a2cb8964mr10933551fa.21.1791452155977; Thu, 08 Oct 2026
 02:35:55 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 09:35:54 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 09:35:54 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <asb9YupPzr9RYV9R@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
 <20260922-nord-usb-dwc-dts-v2-2-ba2b39f1a843@oss.qualcomm.com> <asb9YupPzr9RYV9R@QCOM-aGQu4IUr3Y>
Date: Thu, 8 Oct 2026 09:35:54 +0000
X-Gmail-Original-Message-ID: <CAMRc=Md88N4ptyZzfPAi2sUtvyOEVrT=2srrcWzY0LoVfs7gMg@mail.gmail.com>
X-Gm-Features: AclHuK-Jal4P4xXXUEYcFEiQKagMN6wX5OVx7O9iY7BYsCVsbCk47H7rILenmAU
Message-ID: <CAMRc=Md88N4ptyZzfPAi2sUtvyOEVrT=2srrcWzY0LoVfs7gMg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: nord-embedded: Add USB resources
 and PHYs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Oct 2026 04:18:10 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
>
> Bartosz,
>
> I just sent out a series to add missing AHB2PHY bridge clock for Nord
> USB PHY bindings/drivers [1]. Could you update this patch to include
> this clock when you send v3, so that we can get USB work without
> clk_ignore_unused kernel parameter?
>
> Shawn
>
> [1] https://lore.kernel.org/all/20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com/
>

Thanks, will do.

Bart
