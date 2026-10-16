Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E9746F4A4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156718; cv=none; b=RUE3gT/XGE+bbWzD/DlYLf1aCpdnFUFfDE+7AhJGFHLaQN3UPKxkjL9qMGMsoxBW450yjRry2H1FkjiuBjaBw8YWY/NwTmW5B+3oqIdGECJeAfnyRhEmLaFt2ZRhsA6l6QIhCraFEE6Mih21HtfpTuGJDzzOwwPZiwGpBBubKJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156718; c=relaxed/simple;
	bh=x2BW8oerNSOEYucbHzD1Mf72nQU2zapeYz/1ijKKC0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A51wlo4p6EFiR9RNrUVk555FlY/QTFo8yiPGjc81/+VaVqO5Lg0+RsXhZUN9pnzUtEou0/vY8OYG/rzM2Pp00csgIpr7K8/jSOGouAhLmKtq5V4G+Gj5RYF6hsurdky2MQuHzbG8gymizbj4RzRpMKj2A7z44RnoKivJFPFDh5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=uMKw/fgi; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="uMKw/fgi"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c3fd91337baso222001466b.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1792156710; x=1792761510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDK24tEpJcT+rcp42kZubJw5bx4qYVZ1Fb/7qslQT5I=;
        b=uMKw/fgi3gwq1YGyYi4pEHBVWgaUWJpYNo6XmPIDJ2MAwO0gNO8oyhPfmld3xg6VWS
         qkPWBgjCkZQxit9acVzHoaG6//ArW0KADQz1LAfH4JkaGUW2mhHi8zCIIyHTaT94lDHc
         GMin+sZeBX2/ySQp8QG5Mc4vXbMM06BBbfB4wkVUdGeVhwKGAm1ObjqhP7xtot6yGaS3
         vfoezFnhp0gVikldMSY+cnS5yapgEEi1BLXHEBCdHZkrRmMB4kcl/vrsFiHOMPMX5EME
         9eoD+K54fI47Tzpcrd5szLjYgobX67q9zkCE3iSQ2StrNhu2ZYUrinPjm+2bDhvMb606
         ogsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792156710; x=1792761510;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NDK24tEpJcT+rcp42kZubJw5bx4qYVZ1Fb/7qslQT5I=;
        b=p8B+7lNpB2NpUW7VNzZDimfyxNG20yCwnbHt/UvaYgQD41m+Q0tGbBLXJQHXcG2nSy
         +/+h6dk8TdNoDNaLZyQKxjXvW2oX3kudEXfXcjMZTKXyS2wMqbbJdWP8Mt3wCQYAqEd2
         OYYSCIobAlSF2mA7UR4/FF+B9A60WFcY4WQ8uxjhBPmRdp2xE2aTJrmH2BqSFayV0pS8
         TAwYdPGfo9KcaVeWe0B4Exkc8pdKbMtadjn74awpmaNAJI1eYtsIeDkjuoqmkS+E+M9L
         2vV1sh2Y9IGnvEjsMTG0D7iLnPpqi7KyzOWClBcEefA3MTSuKpcLfeDzDwHrn+6XawoJ
         fbxg==
X-Gm-Message-State: AFq9FYIhlv3BRTtWctOTYNz/xl8/hUlyKbjUtypPcltO3juV6acc8/CL
	ICMKRGYWRCMFq6qtaZ1Ti4IoKOEqqBFzeTT+Ynide1XLL3HRKTlsluKt+y6I2v7cEuozKHVI8x6
	ipNPp3q72
X-Gm-Gg: AYBFou1cyldruvSBFwTzRixT0og5r4ldWdOd5rVkFswBBjS8TFK2+ZO+Ypoh69Y+QPj
	xZ8usu7/M1tVu2zpfElJVEbhHjBoeu8K3qY/jAI2VFpGYaQFMxrPxHP8e+yV/5CTZkbcsAndPYr
	jQZOUw3PCaRjbpsrO7cX0HhjpqOQdTWDVRFd9TSYoxve1RDeCp91fIPYVfL5dcMWwZiGw9H72hu
	oodcLuqQ/mIBhj6/6tXlxneHDDtsmML5q+uNVzKT8p0yeLfe5fZWYljJwyDcAfsHjK32Pit2kVZ
	H2275Zk162G9eA8YKMZ5P9713skc7HYok36SysiUQA+qCbfV7G4cbWN1ZKCQxG/I0q4vWriZosk
	ee6QLzzJda1+Z3VNuywoaEccuBcflVc4sWiQqDZz549oIo7ZE1orbEUXNEtWKYUyR/vllg59+Eq
	WSRph1jvxwX2kfWJQT2MDD1E0mL7uBxc7VR912OC7zBnW5AGTTCodAySUFTnNO28seWupc8pcww
	Aocp12DTHQdzY29gIF76C2cmRv2qycCfiWl9ucbVV/DQFA=
X-Received: by 2002:a17:907:3f10:b0:c2d:c6e7:9e9f with SMTP id a640c23a62f3a-c31aa081161mr2184120366b.27.1792156709971;
        Fri, 16 Oct 2026 06:18:29 -0700 (PDT)
Received: from [192.168.0.105] (nat-108f.starnet.cz. [109.164.53.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm72600566b.76.2026.10.16.06.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:18:29 -0700 (PDT)
Message-ID: <ba1c11fa-5d11-49ce-8780-a57d23187f12@monstr.eu>
Date: Fri, 16 Oct 2026 15:18:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] microblaze: Build userprogs for the correct endianness
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org
References: <20260919-microblaze-cc-can-link-v1-1-01da67e75ebb@weissschuh.net>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <20260919-microblaze-cc-can-link-v1-1-01da67e75ebb@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/19/26 20:43, Thomas Weißschuh wrote:
> Currently microblaze userprogs are built for whichever endianness is the
> default for the use toolchain. They may not be the correct one for the
> actually built kernel.
> 
> Implement the correct hooks to build userprogs so they can run on the
> built kernel. Also test the endianness in CC_CAN_LINK.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>   arch/microblaze/Kconfig | 11 +++++++++++
>   1 file changed, 11 insertions(+)

Applied.
M

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

