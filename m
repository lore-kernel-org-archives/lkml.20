Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9EE47989A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814143; cv=none; b=sW2RoBRUMFK0I+UitUvZZDss2spK2PstYCOAreaZoxfElVUsyWcC/v19VHeAwCnUvuv5pdpGkwIzRNeSqTd+Uy93w2yx+o5ddw9GnZPeGu3xyx1G36cPxwHBQANoGj9iRUf7xCLJSWEW7KW4ZQqP9BFertinPnSucg0vfwPhqX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814143; c=relaxed/simple;
	bh=rXDSy+BU+H+23ibWV85M7YcB8RMk/WwX+AGQ/LhTWeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UhlDz5AmxwiBqDUJa1F5gc+iT3+EQpQTq7sm/BVAjTUyLDMb0kNvqk7QZujaYNoa3G4emTkIUMmdFmL7lyzEJdGqO/bmK4c12wg+doF2jTzyf7/AfxqGk/adoZbz7971JdBud+NZ0PU7aA5+03/lmgIeWGXyYsZzd8pQMPRT5us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDbvHozW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FsBidhoM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDbvHozW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FsBidhoM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0AYQ2275878
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HsMKY3ZM6LxGid9PCtLXClBhJ9KMfSEQKanq6xuXqIo=; b=FDbvHozWAc3Vgbvx
	k+iCtYU2yJzgCrXuH3dfRQI6rUCZKD/uYpqPUBF8Jku1UqzTpzlkJwsHSEIyEZXu
	rrLF1xKg1Muj1+bhF+YHnzMw0vxLZG5Cco3I/S/X0PC6hgfuhHXs/Ek+yPKyuHME
	9M1xLMk61eql1zhryplrcFVMSDVkp0B7ynll99K9zqpAvVutwh55icJ7tp6DqG1Q
	x2AzSC3t3JM2SgMUhalF1oatgGbd/YMExpBXJxEsRbJk1uXsjzcvjm30CWXizXWA
	dPiTm6YyXhPpZO7s7tPkffBVhvyzqx6wxZmzNATyx5ClcwzX9iRu//s81pvtBCSg
	Q67UzA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq1q45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:09:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso404502685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791814140; x=1792418940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HsMKY3ZM6LxGid9PCtLXClBhJ9KMfSEQKanq6xuXqIo=;
        b=FsBidhoMifn3IMwQBmyRPdnMhDhRqVCp5JU0Foa+Hql7I6ANEoFJdQux9OXSrGrDuM
         C5zHO5rwQ92qcHrGY6nX36Ld9dX5BBtXMYqCeJLjPbXXNPYH313jHDBxcRy0O2bH9NJv
         yEjDKnyPEVIwgyD5r2o+wsS+GsEKcFg627amCf/UqZHDUqoHyFIUFGja8BTDKWDXNcqb
         n3UTGGYtyp2SbGd/858KlsYgELIVjIWH9bzgpZ0qP3tZ9eoiTSvgO4hsJDUVI2Itor/W
         l2WFraG5mtqSaeZc/MlfXml1hXbGril75o45yoTmVpdYmmzuFTU+0YZyZF8uaOeVxjGR
         7iSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814140; x=1792418940;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsMKY3ZM6LxGid9PCtLXClBhJ9KMfSEQKanq6xuXqIo=;
        b=IES8VJ+IYf9DUTXSLu6AelhVxlckSk2paWfVpwZ55SvyiP/eI8n+0zgZ1z0NAwUmbs
         XF2jTmoqHEuGoeLxD3w9qpDdG+NZpLhv15Dsnmuo2/PW/gfdpC8V25PA+bNyX1OJqdca
         xKnDyC82KUfDBGEQmf1hwIr4seyAnha+tZlWrRg9jzSpcvil1nU4MTbrO4JZnZeRIU6V
         X3ddLGd4XgQ36KSyDaz558k7yqxsRgfHMahn/TY2mc0apkPNu7A8x73MaJf6NYxPrjhA
         SlC+tr5kYChNST6lA1GinSnIiMYVpqbOoHrcPsQdSSmNLCG08YnWfqWetkiW0sz2Xa5C
         lANQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+Qr3lL6wj4emyzog9ej4kVblVEoTvTZpaVHou2eJV4GkaWGOzGHNeUFomTM+xtYJNEglVJOXlniw3YAM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrD1Y0+Q06HGbWg6obPTow4EecqAviq+aYzBQiTrSRofV9PLdb
	TR0mEr4HSiyFn/PAzLRX7JXXULUxMmjiZ26llkKIVvlqSmSbPLt7Sq1LGqvaztThagyU/xRguVG
	E7MUrEs/sUg2PQXXrxvbx6HCVrTxqPqgSFBVYDEEvwQ5+SNCv+CvV7KmIZMhqy4w4EPI=
X-Gm-Gg: AYBFou0mRDkJJZG3G+v3H3O/u87wmu1fvoHi40UwQTTyTaJOj95QMnnagCt23ZCoj0D
	0kB7VIiF/5okZDRDE/szV2F8sgDxyUaA1iG98xtHgjjf7ik8jNT8qrPxAJ/7E4XWRyulMQ+W1A8
	U6tqjXG9NbTw9brkanHED8YWbnoQWsZ6ObvfhqytJGs9gTgT36d7Ar195PRTYESUISpMg76FYNe
	nxG2Gmg96QibO+DPMjKPEbt8k4ivdToKz6FI7TJ8jBRTa2s1+OeHCwydNkgIabSNo9MZEfuRl6O
	auZA4hDd13TuqNd87KgCZbLis0Kn/3ySAqy6eeuNGhqWoqHISyQTW3+xXCi56qh3oh4zJwuhTAF
	4DP6x0u6BB14NnfRIt98l3JXxF44=
X-Received: by 2002:a05:620a:4693:b0:93e:6064:8996 with SMTP id af79cd13be357-93ebd0c3204mr1662160085a.8.1791814139945;
        Mon, 12 Oct 2026 07:08:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4693:b0:93e:6064:8996 with SMTP id af79cd13be357-93ebd0c3204mr1662154985a.8.1791814139458;
        Mon, 12 Oct 2026 07:08:59 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1a1feb78csm83436555e9.0.2026.10.12.07.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:08:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH] tools: gpio: fix building from the top level with O=
Date: Mon, 12 Oct 2026 16:08:56 +0200
Message-ID: <179181412811.12167.4474187537392007806.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011223358.2327625-5-sashal@kernel.org>
References: <20261011223358.2327625-5-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6acce9fd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HJLiZkcYeBZheiffgpUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NiBTYWx0ZWRfX+0CZX1WAXfhO
 lQqN+USj++tN8xPOWv7QN9hl5JKtOvVIGRTPjdGL4+pfu17jsWvAFDzCoOk9SGExkf5P2f5RKkd
 FFEmymT/AILouK5JUIVr/IeGsLRsLIc=
X-Proofpoint-GUID: JakSr4aTcxLZrtafKu4lx6GSL1RdnTZa
X-Proofpoint-ORIG-GUID: JakSr4aTcxLZrtafKu4lx6GSL1RdnTZa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NiBTYWx0ZWRfXzHBqp8GaP/g9
 njgo/OQetMaChYV/ENCNpgAPo3hA71pnEP7P85waXwqahl/T4RB0OHE8hL+JRJwhKjjLfD+fAco
 5wnRaqmJ/SEkOHJ4RrOorc5oPNQkKGSRY9U5pHtfgni5OUyzUBlsn0N19hD0fHZbOYotdhL4RRC
 +WiSGHCkTuedvXPKJN9i6dJXs7mALm5UDU661fOarOWfDUUyuFnj1YF2hMZOIgHJZPWBhj3CWkt
 tzT6pGxSq7QRNcRcVR2greV7EpfkWVwcc4zCUv+sKyqvlca80xIG0933R34OXkuv5mjGj2jkc3W
 0KT0bRY3aqroTFEp2Qse+QJJhoyKGoOiYjeUb+IX7Ya6jo83/SLl+6K/w/9W1sGDmcLSk5RR8Qc
 MTFXA8PFW5utNHZHOt3iUG9wRFy1vL1GClscUJshLdPqvtksADlEntknt9I1h2Dml4E2NXFHClY
 3g7tuWBOu1AqUfMtgFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120056


On Sun, 11 Oct 2026 18:33:33 -0400, Sasha Levin wrote:
> "make O=<dir> tools/gpio" fails:
> 
>   Makefile:27: /tools/build/Makefile.include: No such file or directory
> 
> tools/Makefile clears srctree, and the gpio Makefile only works it out
> again when building_out_of_srctree is not set, which the top-level
> Makefile sets for O= builds.
> 
> [...]

Applied, thanks!

[1/1] tools: gpio: fix building from the top level with O=
      https://git.kernel.org/brgl/c/52336337f1a01ad803c7f3ddb23f40222e9ad58d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
