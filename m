Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6616E38D40C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207776; cv=none; b=koC2PgIz8haUpCGEDzK3WxR2flpu5uGMMshokfSwZ4Op0F3nkDdjzqTFycEnSlmkAIHS5xxOFBbYThVK4pRKGZb38AveRYbrdja5mSFkqzbTtkdX0dtKkqqqQ8x0NONeP8Xfm86uLAGGQt4aNxEiU5sw3RFvQb17uTDYOkGSGQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207776; c=relaxed/simple;
	bh=edpo7zq4/+2hk0SciTYW5ScKODY3wlH7NhR4s2VSZlA=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=jtOLH1gjodAQ2xtSLYK4EzBQM/G+4dc7v++P5KSoYBoYD/tvCBF8IkHxeCzalmM0B1Mv/xtk2oxkFWybEuisTbWu7Z326zoQk7KBnJLCRVk99jHHG2GqZUyMmwqRmv7NnFl2b901Jl6Kfor6XpR7q29f0bzLszt5pJUOKQRhLc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MbvFZYLq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NW2FyWFn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MbvFZYLq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NW2FyWFn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VIXshE1334973
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N1mlTl4w8l57DwPD8LgVJLWK61Uu+JocvF6j9FhaKYQ=; b=MbvFZYLqzIz5IAnL
	7vx1HrOlHi85oxJ/iu6g4wLl42W0acfKz3/3Za9KWxBwui248NEY7wQK8vEGWHIv
	MEnCgoEsnug4hltj7Pfn10vsh0/RezHoaO8yijGpF/Tf7QFl4yBk3vOKCkrdWjYm
	/su09YJrUjZtQKB8ZyAw9Bi89TyAY9rt+XHT01hbztU8W0ZzapvktW9B2yfaGlL6
	hGcHUdfV8rGN5f8ucUFwvhDYC487L9B30aWxgesS1YS067kL6jB5U9t40jBkQOBA
	zUo3XE+fautP9vjPw5BSELroa1Ie0aPySXeYk0HNMe6/by9/8kuSpoFohmG1m541
	nXY3Zg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd8cvtmv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:22:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so7387526a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788207773; x=1788812573; darn=vger.kernel.org;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1mlTl4w8l57DwPD8LgVJLWK61Uu+JocvF6j9FhaKYQ=;
        b=NW2FyWFnJCgJLoPCb8iBBgqlZzltBp+XLnAvz9qyV1EhWHQ3VWYjHMGUfC3vBZ0diD
         0T5htnvoPsVGGmgIOxIO+/t8DLo5KLBR4Xn77ybvBT8KCrUWibAKNOtc+4PdpnUwQef/
         +TMMrfB3RoytrP3aS7jHVyTRQcTzS71NVyDAxJ/zwiS9ns4QKomJShY/hdvv3pOqO+sB
         hKPeSAt0/V0ShlaBZIDliFWqm3/WNDOspM6Rnc4dPsCmpSo/3Ts8pjld9O0wcaPVUjfK
         fj105lCo2uNbYmdRbH1T3m4n9A8y2LYgH43T/0PRUUcHI6w3O4MvrmUNlhsEkHrSdI/R
         YnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788207773; x=1788812573;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N1mlTl4w8l57DwPD8LgVJLWK61Uu+JocvF6j9FhaKYQ=;
        b=VR8gc2ATIYgKODVNrMof8R8e5ByXXacU8DlToVX4Jcsm6+B6+P8avpkAwBSDr79cWw
         dsizY5Htgs6jSNrmoYUVDlZIaHvcqqJHTNUa+VIMtQdabGj8XojYD+flQLhVBlImO49E
         kSYSoGjqpxawL1f4oUeNmiShq2Gq6cxQ4jFd6xdV2xw0TKfBZfk3h3YMPrsmAnD1rBY2
         OIoLXOL5pB5w/MRq8XqZv+47/QcjwFEAtE0dmVg4LXZba0nBhrH8dA/Iqwj38vLwCePQ
         wMAUBmFr8JX0InoGD7I3HzO04u4juqPf07Fi3zXaXxfYcf2jg7ykI2z7ZhIBKHxfzcus
         0DhA==
X-Forwarded-Encrypted: i=1; AKwUvBw9ixKqhLU9jzLdEGBCoK3PuJyfxGmg9wihwyWHac4cprtneCzabHAPCI6VycR1sRMykZcyVln8ny+j8fw=@vger.kernel.org
X-Gm-Message-State: AFuF++nL1Q+sWpCr7NB01XDH/7qy4Tb+pGYkaQhyLUkxXN8tDowNa7FU
	E9F6W45H6NHq1/kq8g6qBBZSstg71F6BWDX2w3ILV31DLn0UdeM9bu3BaCuX13Tjc6IHAaoN9CS
	Q1k2bU5wI/3H2sH1P9U5H/+1OjNZvOJw+PF6Z08A3BBl6Z7FrZTS+lZ1ibnampI0TCUbVSr6SbY
	I=
X-Gm-Gg: AYBFou0mVKsbr2ZUdm+BwZLz4KKV0VSxTpnCamSQk4ZS+DZ8u3kl98CcyewvMSwuEqe
	plvqJcmZ3Ep+Y2KrpmptT8BiXFG4uX7Ypc7iTUaDwCtd7A5bwt0VQMu5vv0pGm65eIsn82koZrK
	KPKiYoqYA3ZS3tOzbU3CegAYstkPG4JXrfNMeZga822hD7mTFPim365pJXHZ8B++lOIwp5w5TiA
	ad4QTAKVvkGEmjYd7lTqd2AVlg+GzgEyz872NDj3eY0LayPz9VNswFC7v4mNJV4tAF9lMREbLgt
	AqCLVKfuBHMud4zQB2u/Yc6FP9W5nWVVBoI8/N2gBctdzlehdjy0v+37tkZ3wjARcJy4Ff7q7/V
	RmlLAYrBdQCywR+N8RwTPDqKHVOwDImK2N8zPrkLl7ur8ApGj/PS4uuC9mpGhUQFVCGL+kvDg
X-Received: by 2002:a17:90b:4a8a:b0:398:9be8:ea69 with SMTP id 98e67ed59e1d1-39907ec46b4mr3822962a91.22.1788207772591;
        Mon, 31 Aug 2026 13:22:52 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8a:b0:398:9be8:ea69 with SMTP id 98e67ed59e1d1-39907ec46b4mr3822919a91.22.1788207772072;
        Mon, 31 Aug 2026 13:22:52 -0700 (PDT)
Received: from QCOMk1gASIiYhG (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32874498f9esm28854158eec.20.2026.08.31.13.22.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2026 13:22:51 -0700 (PDT)
From: <subash.a.kasiviswanathan@oss.qualcomm.com>
To: "'user.email'" <suruurism@gmail.com>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Cc: <sean.tranchetti@oss.qualcomm.com>, <horms@kernel.org>
References: <20260829170656.15548-1-suruurism@gmail.com>
In-Reply-To: <20260829170656.15548-1-suruurism@gmail.com>
Subject: RE: [PATCH net v3] net: qualcomm: rmnet: require CAP_NET_ADMIN in the real device netns for config ops
Date: Mon, 31 Aug 2026 14:22:50 -0600
Message-ID: <000101dd3986$7f498b30$7ddca190$@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKQ4MYU1OYF5H2fefnV2nbrvGeKVrVRSmKQ
Content-Language: en-us
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE3NiBTYWx0ZWRfX8sLOMoxB/eKr
 QY6cFPNiYstIHqe+hBbRKo61VcKd1ywK2JGXQz/EekCY/Nt+/ISRLXRMVNuOFEMIE0RNw9dkT86
 Yg0hE+K9tG12sUHaE5tCV6XvXOmGxhA=
X-Authority-Analysis: v=2.4 cv=JtnBas4C c=1 sm=1 tr=0 ts=6a95e29d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=hSzng9yqXL38V1c8vrAA:9
 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE3NiBTYWx0ZWRfX7oLwhRuAqP0C
 pqOq2u+ofK4tsWzjecK3cCHA6n0q4je8Hp4lEHjmhnmo6SS/iF2Tj6NR5Cnn2OR+RUjxfSr83KV
 Q6cD2Wt/MYP4ZwVgNdUoHNyWRsyNOgijt1UMllv+a582xs5csRAy1y+i8fnmoQKTzKs6mQUipDd
 zcZFGbGALm8+RQAuwgETypbufQ16O9LoM11fx6ejJl6aWfBG3Vp2yYPUwPc5dUk9zlWH3TnE46V
 rdBBrlflwFpaPSy5eHNTm6PddNJL2YUhCfRazJ1+x0ISKjaYhyukarC+J40GT6IfYGNkNAJcujY
 RyvaH1fkb4EHdCkS7KAKK6cLDR56xTSggHHlzJP0RydjwcVeRx8NIYNmWPh1+dFv3ydXRW5HjWo
 Gfb7HafKUpZ40SGOsZChS6n5Xd1IwZxb/nRE1xwb/hOmBYLEICHI8WHY3o+ZrCVZhq1x4LPBk4G
 +mMdThZ8SYacqKFwX7A==
X-Proofpoint-GUID: 6F4Zv63Cu6-UTkfiCm9DWlHFdhhimnlz
X-Proofpoint-ORIG-GUID: 6F4Zv63Cu6-UTkfiCm9DWlHFdhhimnlz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310176

> -----Original Message-----
> From: user.email <suruurism@gmail.com>
> Sent: Saturday, August 29, 2026 11:07 AM
> To: netdev@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: subash.a.kasiviswanathan@oss.qualcomm.com;
> sean.tranchetti@oss.qualcomm.com; horms@kernel.org
> Subject: [PATCH net v3] net: qualcomm: rmnet: require CAP_NET_ADMIN in
> the real device netns for config ops
> 
> From: Abdifatah Suruur <suruurism@gmail.com>
> 
> An rmnet device may be created with its real device in a different netns
than
> the rmnet device itself (rmnet_newlink() resolves it in link_net), and the
rtnl
> config paths below only check CAP_NET_ADMIN against dev_net(dev), while
> mutating rmnet port state attached to the real device:
> 
> - rmnet_changelink() rewrites the endpoint mux table and
>   port->data_format and, via rmnet_vnd_update_dev_mtu(), can shrink the
>   MTU of the rmnet endpoint netdevs.
> - rmnet_add_bridge() and rmnet_del_bridge(), reachable via
>   ndo_add_slave/ndo_del_slave through RTM_SETLINK IFLA_MASTER, flip
>   port->rmnet_mode and port->bridge_ep on the real device's port; with
>   bridge_ep pointing at a caller-owned device, rmnet_rx_handler() then
>   forwards real-device ingress frames to it.
> 
> A caller privileged only in the rmnet device's netns can therefore rewrite
the
> shared cellular data-path state owned by another netns, and steer its
ingress
> traffic.
> 
> Gate all three with rtnl_dev_link_net_capable(), matching the "require
> CAP_NET_ADMIN in the device netns for changelink" series (vxlan/geneve,
> CVE-2026-68432).
> 
> Fixes: 2abb5792387e ("net: qualcomm: rmnet: Allow configuration updates
> to existing devices")
> Fixes: 60d58f971c1077 ("net: qualcomm: rmnet: Implement bridge mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abdifatah Suruur <suruurism@gmail.com>
> ---
> v3:
> - cover rmnet_add_bridge() and rmnet_del_bridge() with the same gate;
>   they mutate the same real-device port state via ndo_add_slave/
>   ndo_del_slave and have no capability check of their own
> - correct the impact wording: rmnet_vnd_update_dev_mtu() only reads
>   real_dev->mtu; the MTU store lands on the rmnet endpoint netdevs via
>   rmnet_vnd_change_mtu(), not on the real device
> v2:
> - drop Reported-by: (implied for the author), per Jakub Kicinski
> ---
>  .../ethernet/qualcomm/rmnet/rmnet_config.c    | 30
> ++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> index 78d4df55740a1..50c60e553d09f 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> @@ -312,6 +312,14 @@ static int rmnet_changelink(struct net_device *dev,
> struct nlattr *tb[],
>  	if (!rmnet_is_real_dev_registered(real_dev))
>  		return -ENODEV;
> 
> +	/*
> +	 * The rtnl path only checks CAP_NET_ADMIN against dev_net(dev),
> +	 * but the port state mutated below is attached to real_dev, which
> +	 * may live in a different netns.
> +	 */
> +	if (!rtnl_dev_link_net_capable(dev, dev_net(real_dev)))
> +		return -EPERM;
> +
>  	port = rmnet_get_port_rtnl(real_dev);
> 
>  	if (data[IFLA_RMNET_MUX_ID]) {
> @@ -440,6 +448,14 @@ int rmnet_add_bridge(struct net_device
> *rmnet_dev,
>  	struct rmnet_port *port, *slave_port;
>  	int err;
> 
> +	/*
> +	 * The rtnl path only checks CAP_NET_ADMIN against dev_net(dev),
> +	 * but the port state mutated below is attached to real_dev, which
> +	 * may live in a different netns.
> +	 */
> +	if (!rtnl_dev_link_net_capable(rmnet_dev, dev_net(real_dev)))
> +		return -EPERM;
> +
>  	port = rmnet_get_port_rtnl(real_dev);
> 
>  	/* If there is more than one rmnet dev attached, its probably being
> @@ -488,7 +504,19 @@ int rmnet_add_bridge(struct net_device
> *rmnet_dev,  int rmnet_del_bridge(struct net_device *rmnet_dev,
>  		     struct net_device *slave_dev)
>  {
> -	struct rmnet_port *port = rmnet_get_port_rtnl(slave_dev);
> +	struct rmnet_priv *priv = netdev_priv(rmnet_dev);
> +	struct net_device *real_dev = priv->real_dev;
> +	struct rmnet_port *port;
> +
> +	/*
> +	 * The rtnl path only checks CAP_NET_ADMIN against dev_net(dev),
> +	 * but rmnet_unregister_bridge() below clears the bridge state of
> +	 * the real device's port, which may live in a different netns.
> +	 */
> +	if (!rtnl_dev_link_net_capable(rmnet_dev, dev_net(real_dev)))
> +		return -EPERM;
> +
> +	port = rmnet_get_port_rtnl(slave_dev);
> 
>  	rmnet_unregister_bridge(port);
> 
> --
> 2.53.0

The change itself is fine though you might need to update the comment style
to match the networking convention
https://www.kernel.org/doc/html/v5.7/networking/netdev-FAQ.html#q-is-the-com
ment-style-convention-different-for-the-networking-content

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
index bed6f63facf2..5d0a4a428e97 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
@@ -312,6 +312,13 @@ static int rmnet_changelink(struct net_device *dev,
struct nlattr *tb[],
        if (!rmnet_is_real_dev_registered(real_dev))
                return -ENODEV;
 
+       /* The rtnl path only checks CAP_NET_ADMIN against dev_net(dev),
+        * but the port state mutated below is attached to real_dev, which
+        * may live in a different netns.
+        */
+       if (!rtnl_dev_link_net_capable(dev, dev_net(real_dev)))
+               return -EPERM;
+
        port = rmnet_get_port_rtnl(real_dev);
 
        if (data[IFLA_RMNET_MUX_ID]) {
@@ -441,6 +448,13 @@ int rmnet_add_bridge(struct net_device *rmnet_dev,
        struct rmnet_port *port, *slave_port;
        int err;
 
+       /* The rtnl path only checks CAP_NET_ADMIN against dev_net(dev),
+        * but the port state mutated below is attached to real_dev, which
+        * may live in a different netns.
+        */
+       if (!rtnl_dev_link_net_capable(rmnet_dev, dev_net(real_dev)))
+               return -EPERM;
+
        port = rmnet_get_port_rtnl(real_dev);
 
        /* If there is more than one rmnet dev attached, its probably being
@@ -489,7 +503,18 @@ int rmnet_add_bridge(struct net_device *rmnet_dev,
 int rmnet_del_bridge(struct net_device *rmnet_dev,
                     struct net_device *slave_dev)
 {
-       struct rmnet_port *port = rmnet_get_port_rtnl(slave_dev);
+       struct rmnet_priv *priv = netdev_priv(rmnet_dev);
+       struct net_device *real_dev = priv->real_dev;
+       struct rmnet_port *port;
+
+       /* The rtnl path only checks CAP_NET_ADMIN against dev_net(dev),
+        * but rmnet_unregister_bridge() below clears the bridge state of
+        * the real device's port, which may live in a different netns.
+        */
+       if (!rtnl_dev_link_net_capable(rmnet_dev, dev_net(real_dev)))
+               return -EPERM;
+
+       port = rmnet_get_port_rtnl(slave_dev);
 
        rmnet_unregister_bridge(port);


