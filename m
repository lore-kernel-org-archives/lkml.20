Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF71F4ABBDF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659604; cv=none; b=Gt6KKAn3SwFGN01Rg4dj+i6d7xPBqAmaInMdDD1LeCZjChDakyljm7zF6pxgUKz3K+2z8wWiZ9Yay+Ac5RiqOTDrnsQ7Z7ImPzpWpxQIYXFFPF74avlikecw7QM84EuIDj/c7ChWP56jnzuttdhdGUcx18viclpYS9IcAo6WF5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659604; c=relaxed/simple;
	bh=9Ndxc1tBAF8mY91U3vV5DmTzD+UiZfbWF3i7EviwBno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUzXJhsIKqlN4plnG1RaevW/XKn60Z33aUp0eDA/G66Tcf5xGmWG+8nteJXRxTQqRzF51/KS5RRcXaJkaAbP8OQnoYMSdtkiuujClqqMVcdpkXtm4vTw0dTuNwi9+HyBoHJ82XCme3TOTGvAtkuKjr2EZDzLprJzyvZVn9vZFZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KF1YJoNl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bv5C7xkm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KF1YJoNl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bv5C7xkm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDkGRs1714736
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+VM4DE4C72pbzaP9G45mgFYM
	QivvqHf7bmdDimV4fuw=; b=KF1YJoNlSqs6+b171E4rtkq3IQDMjSKvd8JXOO0A
	moQIU0hjbwBAcLfsBRMDP5bjN3WvcmliaoUE4Vt/4WCi9O7q8HPoP6yNdSCDtgVX
	5KOPP2cRZEE08pCzv6Qgj/OOPBKmTgctcKzpvXtVX4xkh8FiK8PnGpFK17Y0QV9J
	sgEyZ0PZUOcbKSLSURYmK8lDrJ5UVptKEARcBDgh+AVO0YpArXf+t9ZPOhdsXPmb
	YozoPS2vBxxYtSQijKwLsVpBy6VO6Q5oJGu9ECw9jm+qRFw+bzko8vDThVwcwnnb
	WhN+LR+F470P2QV/YsxYFcu41jtMpuWDi4A2pJ9USjyLmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grc9w9ymv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:39:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a05d645acso222433885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789659589; x=1790264389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+VM4DE4C72pbzaP9G45mgFYMQivvqHf7bmdDimV4fuw=;
        b=Bv5C7xkmSDxq/vx4QSeR4QMbR0sgMQ39AvlJ+n2DHibRyLBJMrY6/hYkjTlR2jmmjN
         U5Qf8GkhJPse/6i6IAIIifjqDil3aZsbapcvGc7q6DihMXC7Ba2cyuYZeCuERxIZgvKf
         lqUJVDZPBrvveQhvmR4NpChNve+AbKJrJ3VgewX4mPwC2NWeHviNVzIpwGPNK+qTP6ID
         23G7WFm8rFVI/I6y0xVeXgJgSj00gKnb2gM7BO2ovGvIXTJHhsDXhd8VeMRsv6ZG+mOC
         BJjOg9kNFRhvRWdnhI4gOwswYU3bZQchtWOSie7Jxd9GaJCRQ0kdqVk54xSc/mcaRimd
         netA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659589; x=1790264389;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+VM4DE4C72pbzaP9G45mgFYMQivvqHf7bmdDimV4fuw=;
        b=nJJlI9Bmr+91G3DhzmqBJ0EY1sbkDSQQT8ZnpAchYrxMVilfFqEVbvCjG8MuREiq5P
         JrbU5BwtG4PShdiAy1CUN35/4ShIV97tDuYFdJr8WUP5ouRt7jz6R7MHUzNmI37g9NO2
         TaBPqZco3XgnKZK7ELyysvOszc+R2g7CDFJ4ax3b/FGCfbWzEfJPUiwIeVY4zsY0nehN
         UyA5lnF1ZUnWx9M/oiyt5IU/xwcA/TBgEu90yBjpXx4kv4Dfu4nc3soz9srEvirlUrI+
         N59eedavxpae5JyWhsP61KFs8wEewAgBN7XEKCBqTY1CPKuej9Y1z8h38kf7ZfBFK/zh
         lg7g==
X-Forwarded-Encrypted: i=1; AKwUvBy3brpHR7nTwm4yvoFzBGUzqcKvrUMhZmZeQQ5GLQNZ4z7IOMx0AQJTBTeJ1WWf9jxlSgTyzXRHICYl6rs=@vger.kernel.org
X-Gm-Message-State: AFuF++mDssxuwuk1VDuuF+jQIjfsJn6RzzE6ek1ZYYs18mK2jIrwXT8Y
	5dFo9QZOfDGt/GONzWBBAso0iqOT9jRQ3DPK7gghfQywXZYDpTnkU8eL50/gRY4FcjyDH5jZLGo
	jLluAPhsbcqruDhXSBwm6hadmOqjk/aPFXmdUc13arGvGgx1OW58nfYW9j36ICU6RKTo=
X-Gm-Gg: AYBFou1qJrfqiFD69t8WZw/6LSaPU/6rF6y8O00SOL7/EeYLkJUAXCuz1PLEVe5KZIt
	DEMoLLicUqAPI7q50qfgpb3DkSZijdvNleO/Yj031aabPZ2IYlq+4WlMumgXqH6e8zblx5l4lWS
	A8RRrRVQzdVQFuGYSIhblsVS07zgUsnmhnxv5W20mwyoFfbA5fDihr1s1ngc9SlRpleLAZypTKi
	yzSfBOHV/7EAujOec97iVIAW/PgA3ewvrJZOas0gddGiyi88wG3h2xTHK39k+aLqX0KBbNyWJFK
	egfIAT+IOy6g8qiUXaZ/KgivkUKyn8vMAXtNKc7es0EfJZqdfqWOhWU54PVyYQmnm/3Ju5s7Qw2
	bhUpyLG7tqwk80w==
X-Received: by 2002:a05:620a:4049:b0:93b:d79b:9a59 with SMTP id af79cd13be357-93bd79b9ff0mr126533585a.58.1789659589109;
        Thu, 17 Sep 2026 08:39:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4049:b0:93b:d79b:9a59 with SMTP id af79cd13be357-93bd79b9ff0mr126527985a.58.1789659588511;
        Thu, 17 Sep 2026 08:39:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd204d89sm98570575e9.3.2026.09.17.08.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:39:47 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:39:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jic23@kernel.org, sboyd@kernel.org, dlechner@baylibre.com,
        nuno.sa@analog.com, andy@kernel.org, arnd@arndb.de,
        gregkh@linuxfoundation.org, srini@kernel.org, vkoul@kernel.org,
        neil.armstrong@linaro.org, sre@kernel.org, krzk@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_wcheng@quicinc.com,
        melody.olvera@oss.qualcomm.com, quic_nsekar@quicinc.com,
        ivo.ivanov.ivanov1@gmail.com, abelvesa@kernel.org,
        luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com,
        mitltlatltl@gmail.com, krishna.kurapati@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-pm@vger.kernel.org, kernel@collabora.com, stable@vger.kernel.org,
        Sashiko Bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v13 01/12] spmi: Fix potential use-after-free by grabbing
 of_node reference
Message-ID: <le6lnvwdpwdvfcnjupxalgpehqbuwerhvg35inzr43hie5mfvg@743uv5ppkpg4>
References: <20260721093626.96264-1-angelogioacchino.delregno@collabora.com>
 <20260721093626.96264-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721093626.96264-2-angelogioacchino.delregno@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyMiBTYWx0ZWRfX/n9CSQruZVxQ
 p59biugLoFezQEyPtfQL/Q52y8TRoMBit4qO24OQeqrNplQEgtVBDbUFLhZxaAZLnvQl3jvW1o+
 TDBhxHsmc2M5mi4Y9QRujbM6Je1DZYEDaar5aEXPcDH3Ockli8ObzqOvP/it0zecgf12htH0+S6
 evWnIq+TFzNkFZ5/TXVo6O9APAEL4t4nF1LTAfYmnF9TsaVDpAsw0eXu9xevDRKsaLjrwZpT9fs
 N1/R7nPsd9G0YLJKHGjQD5IVUHGj7es64GnI1OaiC3WA6OWoiTDqEVqzC1xxSiV7DAzLMFYkm3u
 EAABfVUTJWAv9mUGuYlaNA81sVbfOpTpHlWFSu2iWtv0V80FCdrUIHDzlqMkBn3Vp/KCsp9OBkF
 ezzFeRFvMI3qvg0A7En/w8D6LMQQga/92wgY0ZJ+UKNY2I5tDsUr4RueyhpjPs2G7UFDfrVjy7P
 Qjhxnctp/KD/fmfR8Tw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyMiBTYWx0ZWRfX/+B3D7YTarTy
 Z3Dd361pzIb1q8LweGw3Jcbb4GVeRMPl2/twbDnTxnOgVOasqnX8PN56ws3qydHjjRzyEGRWm4A
 0bSIOx5zMLLHnj4IXj0J3KBIPccZ16c=
X-Proofpoint-GUID: _Um_UU1A0qHLTLkC5jqUtjxRNDf13hps
X-Proofpoint-ORIG-GUID: _Um_UU1A0qHLTLkC5jqUtjxRNDf13hps
X-Authority-Analysis: v=2.4 cv=EsZHPicA c=1 sm=1 tr=0 ts=6aac09c5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=c92rfblmAAAA:8 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=lMp64ggZct2OJqWbRbcA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170222

On 26-07-21 11:36:15, AngeloGioacchino Del Regno wrote:
> As noticed by Sashiko during a review run of an unrelated patch,
> in of_spmi_register_devices(), for_each_available_child_of_node()
> is used to loop through children, and to also assign a node to a
> newly created SPMI child device.
> 
> Problem is that the refcount is dropped at every iteration so, in
> the specific case of DT overlays, a use-after-free may occur when
> an overlay is dynamically unloaded!
> 
> To resolve this, increase the of_node refcount when assigning (in
> function of_spmi_register_devices) and release the reference in
> spmi_device_remove().
> 
> Fixes: bc32bbd04011 ("spmi: Set fwnode for spmi devices")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260608100949.36309-1-angelogioacchino.delregno@collabora.com?part=2
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
