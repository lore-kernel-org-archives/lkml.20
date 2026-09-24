Received: from va-2-56.ptr.blmpb.com (va-2-56.ptr.blmpb.com [209.127.231.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B076140B0FE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790237483; cv=none; b=A+/wAY+3MU/5xOgtzeR5LPvTKEsk/tYEKx1Q6F/YDii7M+x6gXCCjIONoB+2loR/2FcmTEUwcl2nkCz0Rzu7JI9oWiCmUoJsagcP1Q66sIHhmtf7ts30UHFeCnqvrGQJuiaA6txH+dswRXECCVWstgkeOoSi3bgU+++SbGOg24Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790237483; c=relaxed/simple;
	bh=AoDdUurWe21FElda9XiGLhWIKP/LxkJBdQ3+g0QX3Og=;
	h=Date:To:From:References:Content-Type:Message-Id:Cc:Subject:
	 Mime-Version:In-Reply-To; b=Go9uABn+/XIBJgVY7HN3DR+4StwLkd2oDPhjsr/DL3vpZOul2+fG2tFhqX6UTB03d4fXyrmE81aI8HmQrWdUEZGUo9XtWcMSBsx7OBs6iJ2wesA9U0t3J0BO2aLUIKsheuf2e6Y6p5X4RHfJOpx6PrnVe6/5Bkvo+TMW9Y/+sKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com; spf=none smtp.mailfrom=bedmex.com; dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.b=rZdiQ/8a; arc=none smtp.client-ip=209.127.231.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bedmex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.b="rZdiQ/8a"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=bedmex-com.20200927.dkim.feishu.cn; t=1790237476;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=AoDdUurWe21FElda9XiGLhWIKP/LxkJBdQ3+g0QX3Og=;
 b=rZdiQ/8am1Krzf7nPNakRPnVHxbyiG9Bhc4pCISoPBmcBMZNCLja2h8S6/rx1gXf6ABkpg
 tuPzGi22JYO2PGQWO6zvekqPm1dCLfCXjj0jNleUy1Hy7/yKBFtFQVBofmMmwPvNkY+7zS
 qEogwFh/cAZxWA/68ulkrpnTImKpJvTHPc9vJfF36DCCYHUPvP4PONWAZ/mjggMRbjoxF3
 ik3MClyzRVi1B4++djubBIJs8omsUHQgH9rXj4T1GTpdqVeHJrut1xJD0GRjvnBp59w1B1
 VsWt9RChSk4rSnWmQeyQwU2gAerbxYCJNTjSlG7tT2fOqQzMX49027zmHbihAw==
Date: Thu, 24 Sep 2026 16:11:10 +0800
To: "Krzysztof Kozlowski" <krzk@kernel.org>
From: =?utf-8?q?=E6=9D=A8=E5=BD=A6=E7=AB=8B?= <yanli.yang@bedmex.com>
References: <cover.1790235697.git.yanli.yang@bedmex.com> <a9adff17461c1e66d645d2d0edb35a05a536e1a7.1790235697.git.yanli.yang@bedmex.com>
	<270a77b9-30fe-4b5c-8971-33c1f64f3772@kernel.org>
Content-Type: text/plain; charset=UTF-8
Message-Id: <0c6903be00b92ecb18f2e74fdd9f8cb39e4db47b.1b45eb39.c5f7.44a3.8394.2b83fdd684c2@feishu.cn>
Cc: <linux-bluetooth@vger.kernel.org>, <marcel@holtmann.org>, 
	<devicetree@vger.kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>, 
	<conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>, 
	<zhirunliu@aicsemi.com>, <dijiaxu@aicsemi.com>, <chunqiuliu@aicsemi.com>, 
	<liheng.wei@bedmex.com>
Subject: Re: [PATCH bluetooth-next v5 1/3] dt-bindings: vendor-prefixes: Add AIC Semiconductor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <270a77b9-30fe-4b5c-8971-33c1f64f3772@kernel.org>
X-Lms-Return-Path: <lba+16ab4db1f+a468c7+vger.kernel.org+yanli.yang@bedmex.com>
Content-Transfer-Encoding: quoted-printable


> From: "Krzysztof Kozlowski"<krzk@kernel.org>
> Date:=C2=A0 Thu, Sep 24, 2026, 15:51
> Subject:=C2=A0 Re: [PATCH bluetooth-next v5 1/3] dt-bindings: vendor-pref=
ixes: Add AIC Semiconductor
> To: "Yanli Yang"<yanli.yang@bedmex.com>, <linux-bluetooth@vger.kernel.org=
>
> Cc: <marcel@holtmann.org>, <devicetree@vger.kernel.org>, <robh@kernel.org=
>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-kernel@vger.kernel.o=
rg>, <zhirunliu@aicsemi.com>, <dijiaxu@aicsemi.com>, <chunqiuliu@aicsemi.co=
m>, <liheng.wei@bedmex.com>
> On 24/09/2026 05:34, Yanli Yang wrote:
> > Add the vendor prefix for AIC Semiconductor (Shanghai) Co., Ltd.,
> > used by the AIC8800D80 Bluetooth bindings.
> >=C2=A0
> > Signed-off-by: Zhirun Liu <zhirunliu@aicsemi.com>
> > Signed-off-by: Dijia Xu <dijiaxu@aicsemi.com>
> > Signed-off-by: Chunqiu Liu <chunqiuliu@aicsemi.com>
> > Signed-off-by: Liheng Wei <liheng.wei@bedmex.com>
> > Signed-off-by: Yanli Yang <yanli.yang@bedmex.com>
>=C2=A0
> 5 people worked on this one liner?
>=C2=A0
> Best regards,
> Krzysztof
>=C2=A0
Hi, Krzysztof

Thanks for pointing this out.
You are right, this is only a one-line fix. I will remove the extra Signed-=
off-by lines from this commit and keep only the author and relevant contrib=
utors for this specific change in next version.
