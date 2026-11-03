Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699915;
	b=ExfxHiRpOdxb1PFkraysqigNcyFfkRS+eFdRvxW5lNGutJY4/ig587Ht+bdO5Ol+aKiF
	 4KSNClyKFvsD53fEQb5xGcfJRAciAzary/3x2uVCWd71m5hrSU6ZFGkThAdJsxsiZ8hFf
	 shqZ5Do2pPnLqFPRTNlz7AXNUqCABYn5I/oxFdZ5cU1EbCXB6GDe/VXVuZinZONljWpM8
	 WBj1D6EUnia9SBN1CLaRlU7b208OemOgYrt+ziP8yXjph9XcBC6abDKnOU09iBadkKKr/
	 gZXQ/Xs+sR6/oFyXI2aCtqXXw+Xx5n5wt/lYy/CQakE7yNMsxGWSIODKAy03TG20eUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699915;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=h8VbAAq/OiCxzdza5wuB7U2iMKbdYZdGtWxp29XUI/s=;
	b=U85UF8CJGxoMQiCHeNlapgveZAGDV5srb4fz4grtK4DpC9YPVUn8+9mEkSHEkb17MBMa
	 3tARK1jPvxZpwDBaAD0vad/BKHoWpBu0URRyIo1M0KfQ2r4vq/GBTSZ7iE4wLL5qOAPJ3
	 QYGu7m3N6l3T+Pib7bou96bbLJddweBRKJyvgjodcQ/PxsTmuuLzJcJSXYi0Zs0avK3kR
	 K/0z3zofJGNRx+SQO1Hk7UiEbU8RFumjgQWjckVz6z5aNogRU1hQ22QRfisfzBCpcjd6O
	 gc7xiAQQQl82rufrQgY6A36d94WF25IJs6eNerENH/wX3jSkVIUoJlFn9UOQT0VoggA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=URR+HC7V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EPCnDKfV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77AC606D82A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A77AC606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=URR+HC7V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EPCnDKfV
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A381RWv471215
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h8VbAAq/OiCxzdza5wuB7U2i
	MKbdYZdGtWxp29XUI/s=; b=URR+HC7VSNmr26BD7sbjCXSM8m3Rs0mYiDc87PwZ
	FLwxM/2wDX7Gnbg7TdfqPYR41ymgU4Oq6J7/ehMsKuO/gvXjYuiU5POIktxva4aB
	3QK9UMWQ3Nxjia/YMog5YRWQHg7nyrepV+dbEr6BCxyk1j9trKDUL912mfw2D/58
	+YRYHsJBu8O8u98AeofTzeollGSOnG/YHBh4CHp2UKlO2WdHPcQ+9iIfkrgOAGPn
	8EGfyLTx6tAYuhzKSQPKeSGbBEew7HYJcu6le7wfgKX61uO3AtgYaDyqD72sAbXA
	JaQjtNmLQyVPnVvZ0fvpUS3grPXu302A06K7VpD0qkXsYw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081u4xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:58:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c75523074so80997046d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699913; x=1794304713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h8VbAAq/OiCxzdza5wuB7U2iMKbdYZdGtWxp29XUI/s=;
        b=EPCnDKfV+8B0I8Y41QsX/ff+rANW0MfGqhPsOBtksLiSb5zxpc/ilvKK5n1bkOEgav
         rqJX4H1TPesa4na6AAPZBt7HR0wbF/oWkO4cJSzS3UdP+/UBQBCP8Y+IX0bSAtj1PTsZ
         2LfR5A2WK3PAwuOTyMhbKDWTsU4Wlaylz4fr/8fhx8AujK7EAdkVar0t79I/06QTK3tY
         fxz6QpCy32tnsF+hNwJ6P0Akl4rvVVnP1DBGbcZyyNHkbuKvBA7ACcpJaLDHoet3gpDy
         kP6UvUjP1nuaUI8P8Cq5PHGV6IImbgIQOWR0yvB4ToB8R+8vyWec/4pQGxGQVmys9uPz
         ywaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699913; x=1794304713;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h8VbAAq/OiCxzdza5wuB7U2iMKbdYZdGtWxp29XUI/s=;
        b=1Ta/AT3sJDq7wFZkrQ721QGRfW+ngM58rDwE86ZRB7BhIIE9zke5/evHqN4cAkKzQY
         8FDdik2OskMufcliIJq1vjC9s6M+w/vQJ2uzkPOQJs6r7o85a5DyBWj5jT7Ubcr/wF5H
         M4Ujdx+NU83TubJ7CF2DcjZlZasbnGyrF0kup2fow2GdP6H+leps3ebMaJUT6jXFCVN2
         GlbON9VTrYNbaxA0iPqygnKa17wOiEuoJi+/FfJwSpTN6czdTIbdShPzjfb7BVDz6YE5
         QqKfW8b5VnkrCRqsPHWpI36Sgljbh9NpW4fQC7VL9o2UUvb0kNgFep9X2mFsmSDuske5
         Rj7A==
X-Forwarded-Encrypted: i=1; AKwUvBxbt5UDOIcMf2Vt6Gk2Lt37k3DpUMOEs8u2CDl11aLucOBeb1kj04Dz91j4kutch7Zv0Uf+EiB7SmJYDHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZarVRaQ2mxI7N9WtN/k7rA+1bqnn8CQpEMWitiHOKAvflQODL
	AgGMDo39drRxEAhjYj4cs8YA8P/JagLrHrDTiHKbjYnvJqhN1XUFOvoYDBARtSIQqHYimP6gnO9
	y1QiNdRtZUB6vT/aqLW67rPfq6rogwmdgWLjmoMiW8/S7SFrVICjMc6uOb+q8kfMXQ54=
X-Gm-Gg: AYBFou0OPOGtNh74br5fWX8wMJe9D4664GFWcuoo0KvTUKcEKBZ9+vcI3pn1Bp9HICq
	pTxUPw/Xr9cnOLuSSM4hoTk88g/Y3K0a/gDCgJsZ978XI9PrSfuT6ucN9x/GrTUUXB4liHAo/K3
	nFm57i//eW+irDx0xQTjPSfcZacQwILW54haAmcWGo9/Jbhnbl0rCsy2eQoUdvF9GXHirCQ2+Ie
	7IqjN3tdde2o9El7zGQQrOyj0La1bK5L6BMBwk31csWuxVtzwZq5mpNQqDJAnDcrU1+g9UBFLrv
	MA0uQ92ShYvd9VO4F4J3TSCsHvrZWcvrGDmKVjnyV1u6rEJYNhEyQvM3h7tqQPrTcrE8L0gEu8f
	WNXIVNHaCvd7uTRIsZutlBQqmY/hw9k4NDgzanpUO1D0R6n4iIxlJTYLGx/Tq7pI=
X-Received: by 2002:a05:620a:2b43:b0:93d:92a9:1a5e with SMTP id af79cd13be357-94421799683mr2160883985a.37.1793699912331;
        Tue, 03 Nov 2026 01:58:32 -0800 (PST)
X-Received: by 2002:a05:620a:2b43:b0:93d:92a9:1a5e with SMTP id af79cd13be357-94421799683mr2160881885a.37.1793699911805;
        Tue, 03 Nov 2026 01:58:31 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cf248sm69051855e9.2.2026.11.03.01.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:58:31 -0800 (PST)
Date: Tue, 3 Nov 2026 11:58:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] phy: qcom: qmp-combo: Update SC8280XP USB3 PCS
 settings
Message-ID: <6ri5rp62hyh4iwhtlcjycjnjz4zfcvzt6rort3c2443azr5slc@ka7uyggocbei>
References: <20261102-topic-usb3_sequence-v1-0-5b144f5e6865@oss.qualcomm.com>
 <20261102-topic-usb3_sequence-v1-2-5b144f5e6865@oss.qualcomm.com>
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
In-Reply-To: <20261102-topic-usb3_sequence-v1-2-5b144f5e6865@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfXy35KlOjfjuI/
 P73LB88FqUi83m8ZI00SQ+LhzXDdFKRbVLqp0Q0PvfgkbXYwTyB1s0DeLc1s5fr6Lms5vMUo8MM
 f/oGy3poAddrzqrglDCAveqS+4mosdA=
X-Proofpoint-ORIG-GUID: 7KqhwA_MgL91i1elxoboX7GnWNadLVJf
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae9b049 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=T_UvXWJlDOeQdzyIPjUA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 7KqhwA_MgL91i1elxoboX7GnWNadLVJf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX8qZ+1aNwBsK3
 ZzV2LwubPPdfvddYJlInPl0Kn9dXNqBuiImGyiD07FENlRpBfsd2H3oYmc3a9lZeku441zyDt65
 z9OfmCdTwZTaG4vYcGx6aSjCrjDeWwWnfFsTqTkuXodTHCDcdF4g0QCZmDbyn4GwpUZ0HvOWg+N
 uv85jNXhsT0DvB3SL0O044WJ1fKZmEPmSTh7Mc7jN4q/1KejORMxm9S3YH12mYa7u7jNi6OFpWT
 b4KGXmc7DhTmU1tC7ClApnVLjFX0RQ+obTmgstkIvMAbThY4DongN+ZKsjYOSZ977PRf3y35UC8
 OJarQZy/eD3DFFr3OoVFlCpdooGTdlA8dyYuR1h12asK0+k9jAhcSwGukxqcHJHmcpRvxiwvWfN
 Vfli4weuC35/YzLE29MXLOQ1bUnZ5HTIVGPa27soQ5piOnHoI6H/GdcbaktSw0xjC+PLV7+eAXC
 FqtWiKFLGEUzKv4zs/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039

On 26-11-02 14:58:37, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Update the settings to match the latest hardware reference guide.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
