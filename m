Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407125;
	b=xq1xqNRcwPMYi2fpp6vFrD8GJctnWnOCvksPaRL6gw50zTTVs9cs+UEVtcjvTwZXH/b2
	 IkkcvxbiF1WKNVy3+o3s3J2xKzkhTZF1sgmKELF4/6AaUKEBD6p1wxuZhDcb7vMCNCeud
	 OXySYEY9zYhqGl6rKG1HUUq9lZeKAk/SeavWzpPFzBfMNNz7M3pebAloPmesnfscNfRWd
	 BCS1h49A3yxwNeE46EKwtrqC+RuLhLmtDxmaeDb6fBgJD8dXXpJoT7h2KUNOH3LtWcdCN
	 0kgYQRcck3ckENBuSJOAXcWxG2pe/Ml+F0PPO3qWJQlkhAS6BFKLEThZ2debLV8+o9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407125;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QHCjyWnjJaKib08TgPofPSfS5d3rT38/26nHs0v//to=;
	b=zT/BDwaSm5ZwYlKRIS6UJEGwWQY2lVu5xnIVZObcLjEhXzfUrXGAkHx9sX6hJlhEyxdx
	 MUxqNd0tmzquAudwpIiREFyoTt95Dbpcz+nQ8i2HmmExNI0U+YNWGYZiR+ESKFS0oxs2u
	 EeQjXFElvf5ucJBiDGSXtoJ8HmdhGA0iGKXEbNhXbzuiSzbrXg6TXXAKaGMuze6HLM2Rb
	 rJyU5vCmJyUtRFOfUNVYGLTa98XytadciW5E62FTgnb1Jtwa9PLZYWHNC/mMEa89ufZM3
	 vxak9whbM5vmywd86BRunzWbwuEh42fOo4E6NJ5fRgfv2Lu90axfWsVn67xuKjMHfiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jePkFgnE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J9SZ9Ac5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DDA606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81DDA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jePkFgnE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J9SZ9Ac5
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEGv1l1573239
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QHCjyWnjJaKib08TgPofPSfS
	5d3rT38/26nHs0v//to=; b=jePkFgnEVX0RULsrw7zmearAUw+XslMLC+QTiA2O
	o60WRQj0rvP3SnpnYwb+u0ng7t7hYvWzxKPD/o+kBmTC/A9uTqERoqWqhXnaedWv
	r9vgws8gvjJ8fDVqkcyYlAdg/A57SaHbLAlitobIXU6jQwEubzovDYEb05eGTBg1
	XKEm3Pl1uSUQGtJva7dqwXd+D5syugIMtQrST3tvkxyZCeuNpB8e8r9W0q1neT6o
	4dsHbdp3vow2qJoGgko3MDouSocPSajvW7k5Lew6FoJOv5YYB3/JUviR9hkP39Ch
	IZhHMLFKeBKURT2hVkWgsxcq9/JHOBkgMRMcveJqouttlA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7psmn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:25:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f20addba1so603192885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794407124; x=1795011924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QHCjyWnjJaKib08TgPofPSfS5d3rT38/26nHs0v//to=;
        b=J9SZ9Ac58rfNpyn1ILmQzOPOtrqq+BEVLDT4YvcsJjOOKRTbCgurxVQUk+5QNbukwO
         sfdsnCOWKp7aVOdSbM4TB7gtuTVO9yBiNZAkRwlVGoVk0aSL0DxU8WlLRGgxRskmIzqo
         qvQuNjlBo18gLHl9my4FUhZzgrO+NF/7QoR86xWFJDaIUf66wuEfcd45pcfo4S/m+sxh
         awM9wqSVLGXTBLaqhHBWAh4Wc3C/1bSwDvZkuIvZG62Xb5IzKVfW+9AT/WPEyNi8E3aH
         DLMgoQagDPet2c32lN4QGuJOmvKECcZ2hAK8CsnpkNHbFvzBDvdnw1hZXyZTtltaCmn0
         7GlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407124; x=1795011924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHCjyWnjJaKib08TgPofPSfS5d3rT38/26nHs0v//to=;
        b=CGG3s0p22jDHrHiBYZnK548ALMo44N8YDkeJqxWdXICvW6AeTbdv/PsGAVA/yeqHLe
         MvUe1wwfNG2RzLtPfMTQlFaqGzM9Q9Hz2EMmEsg+MMiWQYyNDJlU4vn4hAaZxckVYb7E
         hnaJln8V/UXH+6MrEVQyqCopHlukWj/15N300dGe1zXQoHEOH1WqmKWVZGrD9EsKLtbd
         xj5eL/SnjqGkQ+zgJYBjV95adnjWpy6NN2ahS5K++nHlEpBG6XPE2TkW8tqdmRAhyT1b
         uyXyEyvDqiDRpLyFW10T4QB3YBgaswvHdLGgHpBFJQIboHOqRz2pstn74EGyCfcK5wly
         pIBg==
X-Forwarded-Encrypted: i=1; AL+hErHLYwZDWTUNWT5KzpUxgxW64m4h/Ra14WrHJyJK4Ri/4Jt/1rjrWbAwBthJav9izo1WrTfnlY1//Kw5oRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xaMyfKcPY6RM55GTF4ucAzGfEm9Hlah/mMugbicUcQuu6KSul
	lM8lKafTZEPmZh6SewTY1tGQB92ZEHC5yCCkOeLgSudrqEASWt7k8W9ridNHtdymzQU400B/Ii2
	tAs0iLkyB+OsrS8o7UOrGj92cDepriX5fyKBOzIkTZ+hw7+21Udp421qpwhyCc/ony7w=
X-Gm-Gg: AYBFou0zDcDkIyr0u/KH38qubnj+5Z6cM7vNfPSyB1PcKcdSN1QFGZY2CT/AqksU3HE
	DmaB2671a2+5qOIHk7T5nyFJQOGuOnPjtpgwgbL08LO3w95Pk64nqF6OcruoBM46UAVT67qjFg4
	veYIJuXdg2ZINHtBWAogd5rD3XVtnfcTnHWObFSPC+gLVK0eDdA158z8Z1ZY1a9s5IATV6ldVF9
	qtiP7S6/KPhrWGGmqwIR5DUmKfumP8Afy0EtFSCufX5Ka5r1OmIPfZuu+5ku+3bffr10Lu7TRbF
	lLLHX8+XDlKu1eGD2085rJIgtTsN3R8HoEvoj3YLDy0iJs6nW6oRcgWWPZEyp0Ml+SUW1ZNZDXk
	bYQEpYMb5UhpU0xH9FXfZfrYC3O+e5KvjFdJ76YDsL/uo/SIDBT8gmkheKMhEqNSNqZiRNLZfNZ
	kQ5NVXILT8As2X6XDXg8uh/scb/aJ0FPafRzoAZwRD+rVjztIIhIB/xHNIcBobgg==
X-Received: by 2002:a05:620a:4711:b0:93e:5daa:67a4 with SMTP id af79cd13be357-947afd6c994mr406652685a.29.1794407123511;
        Wed, 11 Nov 2026 06:25:23 -0800 (PST)
X-Received: by 2002:a05:620a:4711:b0:93e:5daa:67a4 with SMTP id af79cd13be357-947afd6c994mr406648785a.29.1794407123071;
        Wed, 11 Nov 2026 06:25:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c15bc4a69fsm552820e87.84.2026.11.11.06.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:25:22 -0800 (PST)
Date: Wed, 11 Nov 2026 16:25:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Joonhoe Kim <26rote@gmail.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH v8 01/29] drm/msm/dp: skip sink requests while the
 mainlink clocks are off
Message-ID: <ldg46pmbkt2ntfpmhdgu7hq6va7ljck7o7pua6rkkkuij5b5c7@dqhf3ozkjoom>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
 <20261110-msm-dp-mst-v8-1-d040fb33db5f@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-msm-dp-mst-v8-1-d040fb33db5f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NyBTYWx0ZWRfX0koQ2Fk+et7/
 E2bfYTeR1Im1ILTLOiPza04+CeqeBuf9SHgszU0aIjF0nbXu9cKeyGKft7EDBjlysm6hsV4qO8J
 1YJeqjU0o9mBMtG6rJtNmFocULWxqxg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NyBTYWx0ZWRfXzmXp7pw48FVt
 qHfu2WRbSLel9VINZohQlQAcjV9kQr6gCkpRB2lkrBzbLkJFbpTxp+3WFE89eZIpdKFkjwULUpS
 UVZ7uTaO1GX91njlEfpwUnRPsb8JXDmZ/yFy4qveNI6ChA4XJVBfgOfFOC+eUpObwB5IoptAr9v
 MVWsOqBj5g98GjDB/QpXP2j98D0NG76jYNDLyRmvea1XM8ihYFyQTYrkvvpzVuvb1kTHJxmzp3u
 cWgt7IfN+SrOQF4XltqQrXP3lhrUuHFp88z5DGD5JVyVq5+hEgvfeIXb8oIq6Nurz54iHhveoV9
 tnN99YpmuPl+ERcNi6Z0qNWe1MbRNbZnkfeXELLm6G29oWQN2NhVzgU+0uRsUO6QrfBl0dXO3wE
 h1GGwaLb9oOPBdRglJlDQvJ6ZtoS2JKlmAPLaDVtQJrv43L+RJUpn6XdQYvIeRjWsz+iglVzg4k
 DakCCSgJFdWo87wlgYA==
X-Proofpoint-GUID: r8Tm4y3qa-pIDvhRSfSfq27RFINltcrA
X-Proofpoint-ORIG-GUID: r8Tm4y3qa-pIDvhRSfSfq27RFINltcrA
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af47ad4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=_QjLU-fBZjFD5OgerkcA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110057

On Tue, Nov 10, 2026 at 12:54:22PM +0800, Yongxing Mou wrote:
> msm_dp_ctrl_handle_sink_request() programs REG_DP_STATE_CTRL from all
> three of its branches:
> 
>   DP_TEST_LINK_PHY_TEST_PATTERN -> msm_dp_ctrl_process_phy_test_request()
>                                    -> msm_dp_ctrl_off_link()
>   DP_LINK_STATUS_UPDATED        -> msm_dp_ctrl_link_maintenance()
>                                    -> msm_dp_ctrl_push_idle()
>   DP_TEST_LINK_TRAINING         -> msm_dp_ctrl_link_maintenance()
>                                    -> msm_dp_ctrl_push_idle()
> 
> That register lives in the mainlink clock domain, and nothing on the
> IRQ_HPD path guarantees those clocks are running. Disabling the
> boot-time mode for the first modeset from userspace turns the link
> clocks off. The sink answers the link going down with an IRQ_HPD
> carrying DP_LINK_STATUS_UPDATED (DPCD 0x204 = 0x80), and handling it
> walks straight into a write to an unclocked register block:
> 
>   [    4.572532] [drm:msm_dp_ctrl_off_link] disable
>   [    4.573756] [drm:msm_dp_ctrl_link_clk_disable] disabled link clocks
>   [    4.823194] [drm:msm_dp_link_process_request] sink request=0x80
>   [    4.823199] [drm:msm_dp_bridge_hpd_notify] 128
> 
> The board hung on 3 of 3 boots with a 5120x2160 SST sink attached over
> USB-C. On the hung boot captured with drm.debug=0x100 the printk ring
> ends at that last line, the drm_dbg_dp() immediately before
> msm_dp_ctrl_handle_sink_request(). In the RAM dumps CPU0 is still
> running pmic_glink_altmode_worker, holding the bridge chain mutex taken
> by drm_bridge_connector_hpd_notify(), and ctrl->link_clks_on is false.
> 
> Bail out when the mainlink clocks are off. All three branches need them
> running to do anything useful, so gating the function entry costs
> nothing: the first one resets the controller, which its own comment
> notes "will need DP link related clocks to be running", and the other
> two retrain the link.
> 
> Everything else reachable from the IRQ_HPD path - the MST ESI handling,
> msm_dp_display_process_hpd_high() and the video pattern test response -
> only talks to the sink over AUX and keeps working as before.
> 
> Reported-by: Joonhoe Kim <26rote@gmail.com>
> Closes: https://lore.kernel.org/all/20261108011501.4466-1-26rote@gmail.com/
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
