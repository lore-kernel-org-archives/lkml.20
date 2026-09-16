Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DB54AF67A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560244; cv=none; b=VLNF2GMLeTuOCt+t3UAiZaa7PPopDWrZV7nRDcf5zHWwLFZFD9LvBwW4eK0DeW7nNglxaio201tS8hCX2RtGn7k8PlnSdQfCDPKe4Ant35qkdcSpJhl6bKt/EgP6wDO8kRVd7l3Y5Hq5qyAuvTqSCRDHNeLerNrP+SPZAFl6MEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560244; c=relaxed/simple;
	bh=6sK5lF1uG0tPWOFM+OttpVt7fqKt3BCa2jrH2Us6oik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYD8aJE/mXxBxx3CNHkbrQA5U111JlOpVMq9iHI0grqfehXQGhhz9fDqyermKMQj7/An3LMjxV8w2f3tIfx4DtTimyy4l0BMXfFyDFJbKD1bllEVDpClVXEcI+egQyQd95EXT2IJSPDFhFnuJsx9ARJJ7Cfx6zCpFNanXQqFXRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bb4xnBey; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XtCcQUhz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bb4xnBey";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XtCcQUhz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GBsGNh1963855
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QFXgN8orDBjbvQKpvi/E0ueO
	Gqo2a07wjdptO1xinNA=; b=bb4xnBeyACviZAcfpfPaqE9zkcsZPlSAAT1vMJHY
	C23OlXMqgtSOwOKbulh19Z2Z6CSNT05JeBG+u8MvA05K9g4TYMWoHpryergD/xvc
	968WLELgWJShnO1JsJQ3jmMYk/fsz7XpkKSEb4t79RTJCboQbY8lNZkrpKaZ+uI3
	9RVBi6R/5HU074GhGHoW2V1tAtLazz7v+hr6aj61O+8WIS7UvTp/8r9Am5DptPNn
	mQK8Cn6LuzbtMxDGjxRtLpnk9ewNuI/OuuJfKemUCQWdBp0V0cmpITqJ3Q7ohCT5
	+x9GjpxXl2NIYVe8PJ23tGJjzKLk9zy43z1g8g3sKd2bSw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqtn5010j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:03:48 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-805fa97ca69so6893988a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789560228; x=1790165028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QFXgN8orDBjbvQKpvi/E0ueOGqo2a07wjdptO1xinNA=;
        b=XtCcQUhzICyHhEry5k3JXMBi8KQxfpybpzdXLwSm2S5H95o/0vk0ZHC700Mv+epQeK
         KHJmAED59MX3qrLBxRWLwuCmR4m5oRrspF2zhSKALZtwXTnZaUGIp5Yl6q/VJDOlYsTs
         w5uvkJjqxHs4zDw2GAMv3nX57xe9vhg9VARGi80lXU8p3SaOXYC58vB0GlyOGFyYFBaC
         uaop0vg47GDvDAoRQstdVzpCjzfRZywN/FsGDn+elxxG4nkqR6PAitrwLxZeKaiuboTp
         vAeTZ0t80B6cii1/2ec/mUstC8E8clrwQtjKRlXnVt21wFfl7paNzf/uXJLu6M0XWKTN
         EXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789560228; x=1790165028;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QFXgN8orDBjbvQKpvi/E0ueOGqo2a07wjdptO1xinNA=;
        b=mPADGdMZBgmO/on+i3Vy5v7p5wxoY/x1g73Zcnd7nHTmWOOkxjPYQmgjn2ze7Ha3Yk
         ++q0ri2EdUzLH7CzHMxG/vKRwgxrFXBV13aRcGrEiCymVsP5Tpb4kGytv+3tKvSgWrsD
         dAJwo8I9nCrYEMoTIUAdoDQllIgVqgG7aPDbDxA4ruGY/LDF57bmlBVSmGtvPUvDBgov
         3wiIuoaRsRhmIOO8/EPmYo7a25joRHFvpdU8wQIS592lsjElnHJHekjKQ0pQyNUoK5Z4
         35wefG02cPmSyVT4EA+mGDwhUnoaOgYwqBEoDGnTyIwSAsYUFM5zwWWZiz8ullbsDNs1
         cLRA==
X-Forwarded-Encrypted: i=1; AKwUvByKhk39QsRmyVF+axegP7vf3kzBaA3Gf73vuDvx4nJCT7CJYkPH9TslI45E6+EFz1V6LUrhyN3lMIcc+OY=@vger.kernel.org
X-Gm-Message-State: AFuF++lX0RDhVMWmzwNW6ZXIJ38uNZQ5mD67S5yTTbkx+N8kaeu9BOuS
	CnFoy/ZQ41gLI7m5K26prPBGQvJmkjjdTjUeG+5i8K3mQ39C3BOh6pPqOYIy/irR6+09NPep1d7
	UaxbKw6WD/CpKs1/CIvIrdWMWALFAXfqysJIVqxuU3z/Poa32lOMbM4Vc28CBHJrxFFc=
X-Gm-Gg: AYBFou1rWgj/TDiZ2z8MhPIflbvyKaIpmXd9doUwJz01gZec8mp6CZ+obl9XxPbKnbA
	4QjNLpPurXkm3gc74B4Ko8KAe7MCytLeLxXNM+HCgDh1GCsZHiAy+h4yLQfeuYFPitS8ZGtuNXx
	2zuy1IzyPHmfjE5ABFEFK7jwzG03CorRjVX2Hx67G7/VR0fmCMBfqqo4W1wXybjv1j1XgqvDDNp
	s6YGNXYmsBEBP6pb01+3oSy6PWPOHcjz3dY3ztFLrcREIu+aQ6E7oaresgT8XEPv8LlF8Wzuaw2
	n6/fJ49UoKG4CHsBl+nxtWQ4lNDqBbPLcEADXMivJ01Z9oqzOsSzJ+dPD2GHz0lOpm06DmyjoG6
	GK2gs+qY16AVkdQ==
X-Received: by 2002:a05:6820:290d:b0:6b7:46fa:169e with SMTP id 006d021491bc7-6c7d45ec697mr2271825eaf.51.1789560228223;
        Wed, 16 Sep 2026 05:03:48 -0700 (PDT)
X-Received: by 2002:a05:6820:290d:b0:6b7:46fa:169e with SMTP id 006d021491bc7-6c7d45ec697mr2271761eaf.51.1789560227634;
        Wed, 16 Sep 2026 05:03:47 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aee8b0sm16611955eec.23.2026.09.16.05.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:03:47 -0700 (PDT)
Date: Wed, 16 Sep 2026 17:33:40 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Thomas Karpiniec <tom.karpiniec@outlook.com>
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Choong Yong Liang <yong.liang.choong@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: stmmac: propagate platform mac_finish errors
Message-ID: <aqqFnJ2EF828xFFb@oss.qualcomm.com>
References: <CH3PR11MB8413FCBA598F7FABC04ADCFEE4B92@CH3PR11MB8413.namprd11.prod.outlook.com>
 <CH3PR11MB8413069BD77B03793D1A9B42E4B92@CH3PR11MB8413.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH3PR11MB8413069BD77B03793D1A9B42E4B92@CH3PR11MB8413.namprd11.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE1OCBTYWx0ZWRfX91HIT0ZiGJhD
 0FMj6/MFnJgI66igLYcruQaRusjpFcEsGH5Q7zYzPl2y7U/vUTgimdnDLval4vVy4MTXZI0wSl5
 Lr6ZayuxxSZTu7a7KFy8ao0wxGZlcKP+KaHlZzdgeBRP0OjDRX7/t7hoWimTRe2gSSwiwTYRA3d
 6DgUfUsJKfZpSXHCPyQjIYki8CXVzaXyXsxtTyu80b3Z0H6vTRvgMXeCt+e1ry0tSPaMa9ctx3a
 K464L8eCF04OfC0/ic/3+0orfjexD/EqiaTqvS6BdPh0AFS9pHzZVJ8M9hzaX2kbLCE1/VoLMep
 cOgKxZabDwJBKN8RhmQBWNVAjEzmAJZTJfWdsOnWReRLpztwBsO+8BO7Gunky0ysSj9jqiXlvVh
 iUeMQo3ibys2olbRoFwo7x4+MrsrcusqS2QNMcduIOu01cFHL/jnhyk0DcjhVYNkbylXiBKUrTQ
 XuobpjaBBEfVY7+CZvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE1OCBTYWx0ZWRfX8Gut8dYVQZKE
 sJFdp4vJ6o9/45a03zQkHTki1fev2YxEwx3lwoRTVv3bZbPaN0dcMwceOKlbsPGyy0qJ9pV25tJ
 yTG8ejiEd9CowZsHJb4MguPuAnSermA=
X-Proofpoint-ORIG-GUID: N5wZu3ujMrb7mOQEaCzRaXAYsM3N4Vh9
X-Authority-Analysis: v=2.4 cv=K7O3jCWI c=1 sm=1 tr=0 ts=6aaa85a4 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xWJGE7MbY3rzqH8snsQA:9 a=CjuIK1q_8ugA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: N5wZu3ujMrb7mOQEaCzRaXAYsM3N4Vh9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160158

On Wed, Sep 16, 2026 at 08:39:49PM +1000, Thomas Karpiniec wrote:
> From: Thomas Karpiniec <tom@wendy.sh>
> 
> stmmac_mac_finish() discards the platform callback's return value and
> always reports success to phylink. For example, the Qualcomm ETHQOS
> callback can return an error from phy_set_mode_ext() if SerDes
> configuration fails. Phylink then treats the interface as successfully
> configured and can report carrier even though the SerDes is not ready.
> 
> Return the platform callback's result so that phylink can report the
> failure and keep the link down until a subsequent configuration succeeds.
> Keep returning zero when no platform callback is installed.
> 
> Fixes: e654cfc718d4 ("net: stmmac: configure SerDes on mac_finish")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM sparse
> Signed-off-by: Thomas Karpiniec <tom@wendy.sh>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 1fb5f804ea23..1350e92943ac 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1048,8 +1048,8 @@ static int stmmac_mac_finish(struct phylink_config *config, unsigned int mode,
>  	struct stmmac_priv *priv = netdev_priv(ndev);
>  
>  	if (priv->plat->mac_finish)
> -		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode,
> -				       interface);
> +		return priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode,
> +					     interface);
>  
>  	return 0;
>  }

Just curious, are you trying to resolve the issue where an interface
gets created depite:
  qcom-dwmac-sgmii-phy 8909000.phy: QSERDES_COM_C_READY_STATUS timed-out
  qcom-ethqos 23040000.ethernet eth0: __stmmac_open: Serdes powerup failed
in dmesg?

Anyways, the change looks reasonable to me:

Acked-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

