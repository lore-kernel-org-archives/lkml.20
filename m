Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2454483B7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185908; cv=pass; b=skX/u5khNA6K2kcDhsp8mThydBXsmrsx+S0uUEDdU849UXU42z49LcAary4QJTIGsVy7qfkU3+x9Fouloqw3bw1JhihZy/VUcDfzfq/816RIQ04MtvaQ54C6bpFcrv0ebpwvFWxeapil/oyyWvilR1Tt9uaS9GnDxXVcaxg/HCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185908; c=relaxed/simple;
	bh=5ebukEa9X8TLK1zNOHZXcjEycVHzAZwRNrrqasYyvKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQ26JhdotxsKHrSLs7GIEz6GqhfvDIOmcIDS5Uy98HEadKw4pf+ghE6V9TydM0w6DdvTx8VEopDwCAxmJof6roN+X+tR/mb8lBLEzzvL/Xnrsk5ZEipWd2nAXo/w8Io6h79gIpOjXpmby6gCvMmJ40KKeCAEttmf+Dz7NxuU0Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLsbyPBN; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLsbyPBN"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso4043004a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:18:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788185907; cv=none;
        d=google.com; s=arc-20260327;
        b=W/rTY4w8nx7FOkngd6xQ7GxerP10dIcuipIlUqYnq7R1JWkKxaLvkrGaWb/n+f2sjP
         7hX0G4aa98CLA7GOVdL91b0rFjC8mJ09vykPr5uDHPPwPZ3dOLGfsFFa8OIEqQkI7fj8
         BlKL+wtlWT3REdGC4tn4MOQPPxHa7GEsgiFQeBxXaMNyHktF+opdDRoSE+aIz/81zzTB
         30mD84TZ7ABQf9D+9a4TpotBIyeQ9bdh/0viz/lUy0ywCYdKv9kNFwKGMFLYZFfXeS4c
         yQTRa8kyT0TvOQ6PUhRGrOK/teW9ggTpDP/J7SG9bCogSG6dC+lvf8C6E0TyLmgwYTC8
         uSGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1ZOG88pTRBHH6b+RUYSoXdM5pS/61VuSbKJS1GDc7CU=;
        fh=yLl0knLDhg1NlkGKOy3opvqyg86DsvBt3Oi64rew0+c=;
        b=lNm1l1DZAjjk7Rmw3LT+R6kk2viRJmYuq7kwtwnyvTkfyk58YGsKVAVlc6dz7F6lvK
         vfbroVrl89r+RPLzUT0wYDRPGDInPsvWfyP2RkB9ixdLV9wXkNyLI7XWjiNiaWq4QsFJ
         eB4EbTpJhv7K/kmew1GunHfYM+X7QKgM6q8rNAFPzuFrmdy6FAExkcu00u5MhFKCbd7S
         QDGymk3XdoZtWkbMe8iMixbmO/NAI9gYFIu6MwgK/mL6WZ1XtnVUNf6I/l046ohXn2JS
         DUMVZJwy6B5xmtxlzM+SM/cInOPjky9cwDXrn1JIbdcbq4zgv5wotLVeByLQOfHx5Ojc
         mXJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788185907; x=1788790707; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ZOG88pTRBHH6b+RUYSoXdM5pS/61VuSbKJS1GDc7CU=;
        b=aLsbyPBNeRqQU+KBefDS/iiNA3A19Xk+Xh8XWWtQvI/pc9k6E1UCvlvtakSXMb6xDu
         /QemWCiuVO7Ah5lhhz5W1nafLXNxph3PLxyiQ625k8TpZbnhlWmEMMBBOoeNXcWj4HP6
         /HOp2J60b00LgeB829rcXk0xTB4jnmq9pUPS0o5GqWwGrTyXKWIMw+a9DD0QkJDYZUEW
         CSQRJNDyx4FlTyCw9fyshHbiwKjDvM3NS+DoyRz1UPV1WISs2HLyAJ2W62KASgBTbvjZ
         I03aPYozG7IGRoY42zetGY3T7m2zAe1jNfSir6RHj12Jd1O/XE+mjMEQBydrk99ioBLe
         HMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788185907; x=1788790707;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1ZOG88pTRBHH6b+RUYSoXdM5pS/61VuSbKJS1GDc7CU=;
        b=nqqrCkmN84T4b61jJHRqG0l3agv696nuO8pjf6093V/bukTWVpFc0RVTlVxgBE4+LS
         W5VmYerEPkH3nl2TlbpKWSyr+dIsQ0uCvu+DknT/H8jxf3VCak4cHghwD3baLkqtXeMp
         mVcKHEjUeELaJwd4Q4FflLLs9BOcId0a23gF69nQLJXgtTjcoXm79e9gsYF8vgQeznbQ
         /DolMZBXE9IiRy1d2amaVrUWR1sYXaDrpGvb5+xAIOTudqrFuFhrsBGjd0h25mq8L+vA
         uz8IwLgqO+/mAa6Pnw/AnaUlbXaRZJSl60YOguHjmTbdWnrUre3XYSEHTgqx0HbwjY3E
         EZzQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCOI3N4tu4/QNxwEq7k0i3pcOhzjv1gg3ZvVhAWGfSajgjNfNB5PGhZ/+cbdAgN7Md2RCdu1MJI4BjWc0=@vger.kernel.org
X-Gm-Message-State: AFuF++kv5jrm+VydxwuVlIvK1cgUp/nhV5R75Mh++WNtoCD2uDf/yyGc
	1QMGtnN97iX7axYGpSb/QlwFmQ+CCb50iZPwZ3zcLITCPSzC26GK0HWqxbXeZpJrWXcv000Jg18
	pahpMRwG94vQ3VEY1ui42zTa4cJlCKD0=
X-Gm-Gg: AR+sD13WCruoH2w4oHSK5FBgkwh6yuBruCCGhyU0zYn9EoCC3lrEIi5jdC+P1Wkqcgi
	s/3b0mxPN5va9fmorhWwdmvGeT+8t2slt/eCoqCIJd7EXIRQN6+d3Z3MXiBPObycSWXmv2UIAEr
	oB/2pUCZWwZ+JkIEsJz8aJU5UMXCNC3gND8d+4hRrzBoLzRTe12Z9lFfKrv54zJDSdZOU8Wgr21
	8l3TasbjrCpQBJeNu9HGEM+30EFFDpQs0sxPF+GLhvhn+yJtjyULQapWB/RP8DTndVngpXUpRld
	11uJ3pwIfCoerQ8XZ3K05NVCEo9D7LtxxUW3F3Wu4eO9ICo0NwL6MVXHozGs/xQkZ2sMoFhKPwc
	XneL5UmComA==
X-Received: by 2002:a05:6a21:339c:b0:3c3:64cb:9b99 with SMTP id
 adf61e73a8af0-3d265a3df5amr37173569637.6.1788185906618; Mon, 31 Aug 2026
 07:18:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830-asus-x670e-a-hwmon-fix-v1-1-cf0a680ccbe2@sne.moe>
In-Reply-To: <20260830-asus-x670e-a-hwmon-fix-v1-1-cf0a680ccbe2@sne.moe>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Mon, 31 Aug 2026 16:18:14 +0200
X-Gm-Features: AcwNN1Xm-dHdx5qoEWmx-mK7azvrCKK8tNYI9QQLi_Q61e2CGu-085AeqI9F8U8
Message-ID: <CAB95QASxkb0sFxBSSY5PA3QJQEs04rBaKke7Oh9fGo1-asyE4A@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX X670E-A GAMING WIFI
To: sugar@sne.moe
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Sun, 30 Aug 2026 at 15:03, Asai Neko via B4 Relay
<devnull+sugar.sne.moe@kernel.org> wrote:

> +static const struct ec_board_info board_info_strix_x670e_a_gaming_wifi = {
> +       .sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
> +               SENSOR_TEMP_MB | SENSOR_TEMP_VRM,
> +       .mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
> +       .family = family_amd_600_series,
> +};

The board_info_strix_x670e_a_gaming_wifi struct does not seem to
differ from board_info_strix_x670e_e_gaming_wifi just below. Please
reference the existing one in the DMI_EXACT_MATCH_ASUS_BOARD_NAME().

Thank you,
Eugene
