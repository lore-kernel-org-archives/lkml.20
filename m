Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7C241DE02
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278404; cv=none; b=Xwd5AcvU7AXwITVwdRV3nAVk312xt/iNFH451LQd+tski6x4XNvSlERIHSrFxf4mibHqWdblAPQbMjrsjx+poEEone4JOrTkjnLy8mw4t+UXVyta93qWY8KpWQkp+m85BpG+kO71YXzAhkC4dLtbykHGcHc1mk4DH22ybbXYuIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278404; c=relaxed/simple;
	bh=huTrxcKdfe8nY1kwUlc1GSC1lXak8dK0CdfmXAEJSkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cof6ogsLRSQDfHGjy+kwsF+WVSfLYHx7c1Nd5RfNWuXNg3dqTGnrq9VJavqiuzMkLoqYA/jlekJiIScYqE3iLc2/X8+R1JOKCJXOiNpfTBYfKedIEEDkEzK94b1SsJpafN60AdSenwlko5EOFed3egfAyGWSwX6Vvvee9+gP/mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jS9yJKHM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aldjRlxi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jS9yJKHM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aldjRlxi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OIdjvh4001905
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sJZ54tOnY46EejWm4rjxArav
	nzXOLrt8zf7GCS5TDK8=; b=jS9yJKHMHDuk+XIpOD+HvvpR6+DLNjInLGmc8HvM
	FlF+SyiAkz00wLfIOqWsWtEYTtQrcPZxu7EcfBN4VCwqlJOzlme52tJK/Qtzf1xx
	VmZHpyayLVf5EgYcSFWzQ0JX3vfyOjKhuyxk8vJkrGZkUNrJEtOmj6NyUPUUudpW
	kbegPpGQlXjgPx22zkmpdvLLlYJ8d7d+2dTglKSGOXGhLMkvHSQbyjzuyWBv+8fb
	NwryjKAy4NooCi8XZI+zfAN2eMLl5Chju0i5o+V+E4vOEuhbK73jerl67fmyy74u
	3fYPzmDsbspnmJqAR8sGpbrSqVsORW33lhyh/CVV0lXmyA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1rajgdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:33:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c0b54834bso11678eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790278393; x=1790883193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sJZ54tOnY46EejWm4rjxAravnzXOLrt8zf7GCS5TDK8=;
        b=aldjRlxiPFOavSYXLQfbkOY5d1H9UHuNrjg2CjD6F3JBJLLOhDq+6VtQiL44yYFCnd
         dyoNFGcSehoWbdnZm3g9FQzi3KcHA609fmV4kUtqhqkujfeB/8dc6KH2/4+aoxKwTBWE
         0k8SiIQl59LDCNLXF+pCmqV0t7Cz8f5Kt5l/IEv0Qg1O1tw4VON9ujbrQzNcNf1Tc5Po
         z7iBoDnpU6ivopse99C1CmlwsVh5ARndvTKZQunWJ32G5bT+STDIoxaqofQYG5aag01x
         AgGG5gPq+XrOZ3UtCpfcbswxmseiTFz/PGTC1KwLqmZ1obpnUfT4CE1DP03IOdLsVC5q
         OE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278393; x=1790883193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJZ54tOnY46EejWm4rjxAravnzXOLrt8zf7GCS5TDK8=;
        b=PMyKY0+xicecg4ERnA038azsx04ZvtUERLDrNpOAZbMzHrcz+s7QUXAqXA328NLF+z
         YoQKcbSEsDcNXvk7x6MZ2lLprQ7v9Gr7a9E8pdByHh0fRfwlGFg4qBifwNCuIQA6PNwc
         vnOGTbXscQEEIwT+uMwrV+6de39arfCYSSvV+xPnJbQHWRLQICbcVrwySVBbEBJ6ZFhv
         +OkJvaZZ9mQOuZI3vssmRt+52WyuQ//etHHV3Adv84J4wBllUC+Yq6pg0OxTw2z1/mib
         rjE9CsDCsYF1U5chU+sOTg0LjHg9BtOAzyPEhvqkPtCzM/tFRsmGt2pRuNwaD/Uqsvig
         Nm/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxmbd+iSxO9SV4QU/d8HKNgtlLSFjH/qNVDwbSICEwHhN6ojfvFFMEcO8F44P/fkivQQqfHB180/kGzAc4=@vger.kernel.org
X-Gm-Message-State: AFuF++nSVawT4xEKNiCoEwMPUJrKMg3tLlZE0yw31ikogwJyyrp4M1nf
	7C7nBw3KIqJLBbhgqi91NXydAclYWnl852hlFl0B+3IAWM3raVZJi74H6YBDygRbE+9GnYOht30
	2Jp751Sw1mqLhKd5PjHBuLXXO+GgS238GdeTDmcEDrBJOtZ6UuC5F5lhTkGabY32q710=
X-Gm-Gg: AYBFou2R1c9KClpsh7wZ4B4eTldbvrHEGWfhBcnFAtAdb4riggsUNtaegZ+X+VwJPG+
	pk/QuNaOMB7xjgylzhnECBQlg56SQyaVAqCO+WO2lfqStD8VqPij877exaKJfleNbVyjA7HY8UF
	D+yePkNTkWnxHuuaA2UQwvlDpk/pyJEFvnYTVMwYqJKt2mwVw6WjhYcfvdedPbmmBWsofyaFgfY
	/QMtkIoVBKXPwRnYLaRU0n4p1uorfANG/A4rvzHvUklDx2szeMK56HvfxkSB8tqXoXG+3JJj97e
	gNpBwd+TNru3h+3gwCsVxxuHr8952i+Qdw/nA/DNsMvjvx+OdaP286x7piEqrV+/+ZZqQx1KbKb
	5koJaDIgZwSbO+8LsOTEut7Y9Icpy2NWpLFQB2ZwGTFtyKJzSzTI3vrce+OoLsC01AMmSFzW3Rz
	14l/94P+3xTgB9y38AQdu1
X-Received: by 2002:a05:7022:b048:20b0:143:858d:fb0e with SMTP id a92af1059eb24-14503d6711dmr4536393c88.0.1790278392287;
        Thu, 24 Sep 2026 12:33:12 -0700 (PDT)
X-Received: by 2002:a05:7022:b048:20b0:143:858d:fb0e with SMTP id a92af1059eb24-14503d6711dmr4536348c88.0.1790278391435;
        Thu, 24 Sep 2026 12:33:11 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm653140c88.7.2026.09.24.12.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:33:10 -0700 (PDT)
Date: Fri, 25 Sep 2026 01:03:01 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Ravi Agola <raviagol@qti.qualcomm.com>
Subject: Re: [PATCH v4] drm/bridge: lt9611uxc: support displays with up to 4
 EDID blocks
Message-ID: <arV67VEl259RsoYe@hu-vishsain-blr.qualcomm.com>
References: <20260922-lt9611usc_edid34_misc_next-v4-1-47d5315821fe@oss.qualcomm.com>
 <96be97088cc0d436414f0f9552fa7442312ac719@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96be97088cc0d436414f0f9552fa7442312ac719@intel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA3OSBTYWx0ZWRfX1WvKFfHtOg/R
 B8liyiyNLdg5SmtcQvjKzC8Hb8fFFri0SjKl2R7dgBjqOPLYcJf+CsD+oT7dLnhGuNrXgDTIYbE
 5VZ8lGRVQQfamsZdPz5DfEP144xsOwIuph3CFjeQlN0/EHDlCUnTXg574T8gbkGQjr/29FNNOyk
 PeJqVb2Ybrm1hLyR8/J4NOY9yvNS3+0tNmOJJt8j83MKFoIXbqW/lY+7uMX8hHR2ub+ZaiV+eSu
 fll3/ZzmfujOTmajwLclJPnpmdgqDHi2Em/BfLwRmGDXS6V4XKZRdKHpEfOteZVJIXvowwqh9vS
 RXYRSe2Eib/bfc6UCeavsCTgDOPXIi9JQlXr9TiMFzMWFEz1yJIWjcOtDYdCbEdh6H7WXgZkg4P
 m+vRqCTGMtAmETdXUv7H7NUNP76BY/lmmVS6EsFESVmx6l6YBKtcd7K8N3IQamCT+VXZPeHJy9R
 RxsXQhXMTw2qdRDu8lQ==
X-Proofpoint-ORIG-GUID: wC5a6sDmsdJJJwUCk1SMktSjTeCUvnZ3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA3OSBTYWx0ZWRfXwPKJw4PZXpy0
 PQdCsZQWlAht+7aD6RbftMywqjRVYgXPRLHPBhNab+hyTKi9A5+Pbg6BIfR6mAGWKsAF06XbYFQ
 jZ2DkquSppvoMNmsnL4KpddwkFp8/uY=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab57af9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=egjODiOu6V-NXdxj13MA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: wC5a6sDmsdJJJwUCk1SMktSjTeCUvnZ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240079

On Tue, Sep 22, 2026 at 11:55:01AM +0300, Jani Nikula wrote:
> On Tue, 22 Sep 2026, vishnu.saini@oss.qualcomm.com wrote:
> > From: Ravi Agola <raviagol@qti.qualcomm.com>
> >
> > The LT9611UXC bridge can fetch only 2 EDID blocks at a time, which
> > previously limited EDID reading to 2 blocks and prevented support
> > for displays exposing more than 2 EDID blocks.
> >
> > Add driver support to fetch up to 4 EDID blocks by re-triggering
> > EDID access after the first 2 blocks are read. For block 0 and 2,
> > set the EDID ready flag in 0xb028 so the bridge can expose the
> > corresponding EDID blocks, then retry the read until the expected
> > EDID is fetched.
> >
> > Reset the edid_read flag on HPD disconnect so that the next
> > connect event triggers a fresh EDID fetch.
> >
> > Increase EDID wait time from 500ms to 1000ms, On Qualcomm rb3gen2
> > platform sometimes edid read interrupt is coming 600-650 ms after
> > HPD interrupt resulting in edid read failure.
> >
> > Signed-off-by: Ravi Agola <raviagol@qti.qualcomm.com>
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > ---
> > Changes in v4:
> > - Rebased onto latest drm-misc-next.
> > - No functional changes; replied inline to the two Sashiko-bot
> >   review comments on v3
> > - Link to v3: https://lore.kernel.org/r/20260722-lt9611usc_edid34_misc_next-v3-1-7ec2bba6ff8e@oss.qualcomm.com
> >
> > Changes in v3:
> > - moved edid_read state change inside mutex lock     [sashiko-bot]
> > - returned -ETIMEOUT when retry_cnt is exhausted without a match.    [Sashiko-bot]
> > - Increased edid wait timeout from 500ms to 1000ms as edid interrupt is sometimes taking around 650ms time
> > - Link to v2: https://lore.kernel.org/r/20260624-lt9611usc_edid34_misc_next-v2-1-24ce3f5770b8@oss.qualcomm.com
> >
> > Changes in v2:
> > - Removed memcpy and doing edid fetch everytime. Required an update in firmware as well for edid block0 reset.
> > - Verified patch with existing firmware V5.0.21, patch is not causing any regression if V5.0.21 firmware is used.
> > - Firmware V5.0.22 is required with this patch to support edid fetch on more than 2 edid block monitors.
> > - Link to v1: https://lore.kernel.org/r/20260517-lt9611usc_edid34_misc_next-v1-1-5e2fd8c6399b@oss.qualcomm.com
> > ---
> >  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 80 +++++++++++++++++++++++++-----
> >  1 file changed, 68 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > index b3bb7f2cebb3..a74077a65f62 100644
> > --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> > @@ -28,7 +28,7 @@
> >  #include <drm/display/drm_hdmi_audio_helper.h>
> >  
> >  #define EDID_BLOCK_SIZE	128
> > -#define EDID_NUM_BLOCKS	2
> > +#define EDID_NUM_BLOCKS	4
> >  
> >  #define FW_FILE "lt9611uxc_fw.bin"
> >  
> > @@ -167,6 +167,8 @@ static void lt9611uxc_hpd_work(struct work_struct *work)
> >  
> >  	mutex_lock(&lt9611uxc->ocm_lock);
> >  	connected = lt9611uxc->hdmi_connected;
> > +	if (!connected)
> > +		lt9611uxc->edid_read = false;
> >  	mutex_unlock(&lt9611uxc->ocm_lock);
> >  
> >  	drm_bridge_hpd_notify(&lt9611uxc->bridge,
> > @@ -380,13 +382,39 @@ lt9611uxc_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connect
> >  static int lt9611uxc_wait_for_edid(struct lt9611uxc *lt9611uxc)
> >  {
> >  	return wait_event_interruptible_timeout(lt9611uxc->wq, lt9611uxc->edid_read,
> > -			msecs_to_jiffies(500));
> > +			msecs_to_jiffies(1000));
> > +}
> > +
> > +static int lt9611uxc_read_edid_block(struct lt9611uxc *lt9611uxc, unsigned int block,
> > +				     u8 *buf,  size_t len)
> > +{
> > +	int ret;
> > +
> > +	lt9611uxc_lock(lt9611uxc);
> > +
> > +	regmap_write(lt9611uxc->regmap, 0xb00a, (block % 2) * EDID_BLOCK_SIZE);
> > +
> > +	ret = regmap_noinc_read(lt9611uxc->regmap, 0xb0b0, buf, len);
> > +	if (ret) {
> > +		dev_err(lt9611uxc->dev, "edid block %d read failed: %d\n", block, ret);
> > +		lt9611uxc_unlock(lt9611uxc);
> > +		return -EINVAL;
> > +	}
> > +	lt9611uxc_unlock(lt9611uxc);
> > +
> > +	return ret;
> >  }
> >  
> >  static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
> >  {
> >  	struct lt9611uxc *lt9611uxc = data;
> > -	int ret;
> > +	int ret = 0;
> > +	int retry_cnt = 10;
> > +	unsigned int edid_ready_flag = 0;
> > +	bool header_matched;
> > +	bool edid_valid = false;
> > +	const u8 edid_header[8] = { 0x00, 0xFF, 0xFF, 0xFF,
> > +				    0xFF, 0xFF, 0xFF, 0x00 };
> >  
> >  	if (len > EDID_BLOCK_SIZE)
> >  		return -EINVAL;
> > @@ -394,20 +422,48 @@ static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, siz
> >  	if (block >= EDID_NUM_BLOCKS)
> >  		return -EINVAL;
> >  
> > -	lt9611uxc_lock(lt9611uxc);
> > +	if (block == 0 || block == 2) {
> >  
> > -	regmap_write(lt9611uxc->regmap, 0xb00b, 0x10);
> > +		lt9611uxc_lock(lt9611uxc);
> >  
> > -	regmap_write(lt9611uxc->regmap, 0xb00a, block * EDID_BLOCK_SIZE);
> > +		edid_ready_flag = (block == 0) ? BIT(0) : BIT(1);
> >  
> > -	ret = regmap_noinc_read(lt9611uxc->regmap, 0xb0b0, buf, len);
> > -	if (ret)
> > -		dev_err(lt9611uxc->dev, "edid read failed: %d\n", ret);
> > +		/*
> > +		 * Set the EDID ready flag so that lt9611uxc can fetch correct EDID block
> > +		 */
> > +		regmap_write(lt9611uxc->regmap, 0xb028, edid_ready_flag);
> >  
> > -	lt9611uxc_unlock(lt9611uxc);
> > +		lt9611uxc_unlock(lt9611uxc);
> >  
> > -	return 0;
> > -};
> > +		do {
> > +			msleep(100);
> > +			ret = lt9611uxc_read_edid_block(lt9611uxc, block, buf, len);
> > +			if (ret)
> > +				break;
> > +			/*
> > +			 * Compare first 8 bytes of EDID header for block 0 and block 2
> > +			 * to confirm EDID read successfully
> > +			 */
> > +			header_matched = (memcmp(edid_header, buf, 8) == 0);
> > +			edid_valid = (block == 0 && header_matched) ||
> > +				     (block == 2 && !header_matched);
> > +			if (edid_valid)
> > +				break;
> > +
> > +		} while (retry_cnt-- > 0);
> 
> What's the purpose of the above dance? Why do you have to try ten times,
> and what's with the header matching? None of this is explained in the
> commit message.

Fair, sorry for the missing explanation. The bridge only buffers 2
EDID blocks at a time at a fixed offset (block % 2). Writing 0xb028
re-triggers an asynchronous fetch of a fresh pair of blocks from the
sink, and the bridge has no "fetch done" status to wait on, so we
poll the buffer instead: 10 retries at 100ms apart, i.e. up to 1s,
which covers the fetch latency we've observed on this bridge (same
ballpark as the 600-650ms EDID-interrupt delay mentioned in the
commit message).

The header check is how we detect the new pair actually landed rather
than stale data from the previous fetch: block 0 always starts with
the fixed EDID header magic, so we accept it once that magic appears;
block 2 (an extension block) never carries that magic, so we accept it
once the previous block 0's leftover header is gone.

This will allow EDID fetch for more than 2 block monitors like Dell Curved Monitor (Model - U4021QW)

I will improve the commit msg in next revision.
> BR,
> Jani.
> 
> 
> > +
> > +		if (!ret && !edid_valid)
> > +			ret = -ETIMEDOUT;
> > +	} else {
> > +		ret = lt9611uxc_read_edid_block(lt9611uxc, block, buf, len);
> > +
> > +		lt9611uxc_lock(lt9611uxc);
> > +		regmap_write(lt9611uxc->regmap, 0xb028, 0x00);
> > +		lt9611uxc_unlock(lt9611uxc);
> > +	}
> > +
> > +	return ret;
> > +}
> >  
> >  static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *bridge,
> >  							 struct drm_connector *connector)
> >
> > ---
> > base-commit: 8ef59ee794076e2b58cff357b12de2ba5d441271
> > change-id: 20260517-lt9611usc_edid34_misc_next-b02592de0b25
> >
> > Best regards,
> 
> -- 
> Jani Nikula, Intel
