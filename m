Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508CC323417
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760012; cv=none; b=U5l3sdBn3M3B+nxYpl0gIzwXJsildMNWkv/8WDfc2I7mpG7srAw8ZMo8Y91s+V/oiCEKhzsNVJ3sBBT5DqVuv9FaOxxfI5A2Bn836Lvow4ye2cPwEw4+sCO/i01jPrGZcEMrZ25j4hJqaqvnWXrrSHplb65FziNLgjazk7Efc6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760012; c=relaxed/simple;
	bh=hBrb+NyvPj9CM+RF2lTBAHr6VBSADiu/isAxEySL+cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e0jsoCijgQp+yJffNdDf1Kwxvbkek5ImpUPCRHx6P+Y7d+6PXp7pAgTLL+n4qGrTuhtpxm5nBbpJWV2FBYHqqwMmrpclj5B+oivnCS0HG3xiyIL8jFRjoblf3zKqdOrJbA2ZYvcGmbDJxMPpuUX85QGbIeFVyMQdCfp8HDK3T/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JwWnpr99; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBKT20xq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JwWnpr99";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBKT20xq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDv1jE4137525
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ycV5lg2naMiHanoVjb+u1u4qUet5nY7n29mWqjlsxtU=; b=JwWnpr99OAfzLOcn
	G0ng1cLkzBngaZOvgaej9/E54usQ7CAW197h7/QqzodN3Lw1HsnPbZ+oFIALImEh
	fz1ZlBAzOx5UF6X+5HI1UkT/1rfQ1Hzv6Q9Uv31IL1FNbNLA01mO61ZyOsD+TukB
	zbf4WCV+Un1s7tmgbfktFZPHG7EIRPZJx0IaBywl8WIIs1BHJJFbKEk446yCWYct
	1K0bcGQzy3kVPEphgFASHNhwtFPOz+H5LwgGRY8kVWPH9wtsk0PAGRlCuuoT2gkN
	GBtc+3iHq41TihbUHPYMUXBm75oPRwXCMo/GIyY3PwYq0ZgkpB/y+jYkacr2Loo+
	1In/qQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthsyh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:00:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e9489f62bfso15131376d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787760009; x=1788364809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ycV5lg2naMiHanoVjb+u1u4qUet5nY7n29mWqjlsxtU=;
        b=KBKT20xqAsZMXJsPn435mbk+K6H2zJugRwsLphN7nQ2XEywNWKuGOQyaHPvfXA73tH
         8FZHpIH+GJy1WUrvzzP+A8VA6mjOgvcu7b/TMfeuWUCv2Ba3dq4XGQFGA8pIEWDdmsoy
         3nyGefwfM2ruNYghpm6nIuIUQ41sbDISsYsgq6TzrlCSw61btXpPPYuf0O99e00PuH62
         ExYZ2Fnoq2HhPPPasFxOsWFbQQYIZX3q+o/d2QIwOQ676TG/ZDMVZCPVjDPMXyk+bAdT
         ugeQQRLFABx6nJAM9BObOLnDHb5hYNHmyiMLjY45FWi5vHmvkxM1W0fAkUQi4zXvKZUl
         j/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787760009; x=1788364809;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ycV5lg2naMiHanoVjb+u1u4qUet5nY7n29mWqjlsxtU=;
        b=Xz9IG43fUixq+Jt+4LtGO4Bo8atakFAC7cmOQ/kP3kput79FeVBjb0gGOUNKwk0+w9
         qgXeh6FlYgnPK4AmKeCuLMbZPBDESmuwUI3SeXNbNIENoVuSkiXS4GhsUeZ/Z0XUthDi
         rGpThwAqzU/oZCbb9+EXbAEN+1a7aSsd6v9RMjvDuSLXXwCV6gqwm/EoW0CqHafKFTQC
         H8QSEd4XXxZHnYc9ua7cy2OcUtpK0bDHdyCUzBkkjymp//S2wm89rqeLs/lNYLOhfXfo
         HSZuCWHzbzwjJwSQV9HkW7LTsXBmXJmK8v+84Ji2WTzRpOp1FDGBi3gfjcTUriOBYPZ2
         Wxpg==
X-Forwarded-Encrypted: i=1; AHgh+RofECKPJamTRowF1Uv8JS9IzU4WuqRYzc6+IKEJQBh6P690nE/odT1cKgSfSO6KWS6vpd19KmjujXNUuFU=@vger.kernel.org
X-Gm-Message-State: AFuF++nIqy0FhO237tO/3Hk7TNcX0r0npWBqSdHS3AoVmsx1pPFjadjm
	ehTP2dXusSfIz0m/4ndMNIXbGZpUTlYdP/mcCLobpD5yB8uBG/LBnSP2vMbX6NNKPikaqmtk5qD
	nBYHli+BjWMR+toHQyrMhrTpNyW/nCtPp8ykWBByn4MAJr28kgZ0cH9CotHVr6ZaE9rk=
X-Gm-Gg: AR+sD12bp5UmfbERZbzpgu5PfJvsaakKENxisWGXeRNxyEx6uPkR5CfbfcfX4dbQEmg
	e8TPSrGosofh6uxjr9584qnOPL2R10NIMiyCeVsdASzgSp6Xc/Py7DUnB8iJpaIXYMxFMOu86Qn
	3zOxXbg9ibIQ+q/fnI7lmW5AkRUCEhID1le2l0F7HHR5HFkc4kBu9rV3+LOh0ls3zAZM61FJzuJ
	aPugSXG5GXKefMnFRy7D4dtb2j934DI6alsCJ/DahmSSOa08F6JJmaaHs9J/HyyCgh6zu7xvClw
	ngh1umPrNs4IzryqYkcOqf84x9cOeb/t2JKZbBqrrhsXWL2jtUKhHOAllhtSWCfOqvgy5SmhKDX
	43Lq50SH1N6djk+gd2d8JBSy2rHU=
X-Received: by 2002:a05:622a:5918:b0:51c:10e8:ac7 with SMTP id d75a77b69052e-52e423b067emr85551001cf.37.1787760009163;
        Wed, 26 Aug 2026 09:00:09 -0700 (PDT)
X-Received: by 2002:a05:622a:5918:b0:51c:10e8:ac7 with SMTP id d75a77b69052e-52e423b067emr85548841cf.37.1787760008309;
        Wed, 26 Aug 2026 09:00:08 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfd4:a0a3:2df2:7724])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd56acedsm20593875e9.3.2026.08.26.09.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:00:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org,
        Michail Tatas <michail.tatas@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: Put fwnode reference on failure
Date: Wed, 26 Aug 2026 18:00:05 +0200
Message-ID: <178776000251.70874.9622772763233595457.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <an4Asr4tx3D2QvLD@michalis-linux>
References: <an4Asr4tx3D2QvLD@michalis-linux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8f0d8a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ugtsdxiNPf_PuXVdW5kA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: M3aSnle9bvjhyWR-NcXQvqssPJSO5lmQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEzMyBTYWx0ZWRfX2l4jpgSsQ3xz
 OvL1bEDYU/ekeV5EPtAqDGs7+HeJUXVtMcvN4PZjjLfyxyFnIcouZTiElJa+x4jhzAjj+ycxVsW
 mIDnYe8gIwrpnwTzgAzJr3Mz/prTZIspf7xHNS9/d/I2YxzpEPNJ+1aS7iv6TgTCNbqXEu0wSto
 tBQFLw9VHwpEnEP83dHjQ9IixyAcVVIGE1ptLze1VuYVdjOZACNNHX1l8B5j9iC9NmbEyPGyWX4
 PF7chYsNPdL72aSU1gcGDu+AAp7D1EdWaTto9tlJITM1JTAiz/vbro1LhQL5EweCTfuPncPmGlh
 hFT4ZD/5VM8nuVT4Q/fmLzrZLBZSYcDqm0Hl8L1plMCQaOUafBMOawnHLrj8wScORL71b5CofgP
 JtOXDJgiVjfGq7FWm6rVWBVhOk44+WLMQdTyLDuI/WM3Ekri34UWkB3CfH4Cv+rA5/3rydbcem+
 BejzVtjNFXJMsVNn0/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEzMyBTYWx0ZWRfX5kNdpUjMQtZo
 NBjle16R5j5QXrKzRtB/xbgORybmtciLnDH7C2K9hkXRa6Su+W8/QzBS61gVKxwM1+b6RyOnZQo
 0ZHOjhs0NG1pJ8+Tbt8nRmVtog9fPVI=
X-Proofpoint-GUID: M3aSnle9bvjhyWR-NcXQvqssPJSO5lmQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260133


On Thu, 13 Aug 2026 20:36:50 +0300, Michail Tatas wrote:
> We get a reference to the fwnode handle which we pass to
> gpio_shared_make_ref. In case it fails we do not put the reference.
> Fix by putting the reference in the failure case
> 
> 

Applied, thanks!

[1/1] gpiolib: Put fwnode reference on failure
      https://git.kernel.org/brgl/c/16b10f64c63f78220c3b4035f1ed6cd3bdcb0b02

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
