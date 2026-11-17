Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910108;
	b=iDEkX3axeEXQccvEQ7sBfmcsor1zcX6QGaz9O8vdUkFFeg0AJRgwSotfw33A1zZ2fAm8
	 64JY9l+vrtGRNn0bUTfS9Q2xLRiZOFh0pbpt1rxXKf8heAUfwpG/Hg6WaNF2iondV1U2/
	 uLxGmkJ5md+DFAln4k8Poq98ynbdj2d8ytZwo91IXFh1yrsSVSSyjYi5b5rTUDK1jqxEC
	 nrbwZHUhn6OVHV7rZofSYuufxVJ01sqAA1I4oU4I2qK6k6hgoBt3ElZTJ/d+s+EETltrU
	 cTmR7prrEB+j3+NPfcMY0eIhGjA8+hiuhF7T3L+QJP3ZuSnhrI4jQT31ytSvf/i6e2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910108;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=71/VVXS9BeuWmakxmuuJ3siEvp9CNaloZsNO9/RiEQg=;
	b=zS3amqfFw+rM3zn/8qUo0ptrNxhItedh8qxJU4TXqr3moNRVQ05KdrQd94HsMZ3Fiuh/
	 t0hocV0PRicA6DqGoQ70DI2jcrSs+7LNU8k0vigeETxkbPGbIb+CSG0prK+9S3bgfguwL
	 ey9CQ9jT/UXqijoonZqJNVp082yhRNi0QqY7RZsmf9MShj/YvWIU5ilM6sFnPVtln4Ihw
	 K4jiMnu19ixr9SsuePkJ8Nr5G6WzwNAyV2pdNOzFHff3MXkBx+cNMbTQtPu2QvQEbEHi/
	 YaURfMEqS6dqHArs1hSubPBx4uoQfbFjp9DePTFvFAMu9Gliu90vI5uH460WM6K912Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AbQRl9Sp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=caePMNoc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CDD606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68CDD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AbQRl9Sp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=caePMNoc
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8dJqT3624121
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=71/VVXS9BeuWmakxmuuJ3siE
	vp9CNaloZsNO9/RiEQg=; b=AbQRl9SpgK1WuJyN+6dJi9yULWVDP2AgW/J6kEMC
	BS73aQmJLCFctBdD0PnGgJsbLJ2ndqieRJPzmld/RKi57wcF47KGYBHPIQizv26l
	BE27Jy8zCAxbYw37LzgUKRLAkdK2PEayYSBdTZfvuU9waqvb4nqFnYil5AcOuanw
	7hNDYswvpwAqW/uAujNaI8MQ0qiddi1H4MFItvQHcn9kGtzx4Tlngzwt76NKTqXQ
	hqIHt+yfCvn9f9cqdsmBWwmj3G8PDkltdyDZCk7G4gaJ5hpZkapMCkfpjdgFe4eJ
	FdidEDDLSwWahWhSx6OC6r9drR5L6JbOlSh8J0J5vTLGyg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rek1r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:08:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-948d83322f6so745797085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794910106; x=1795514906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=71/VVXS9BeuWmakxmuuJ3siEvp9CNaloZsNO9/RiEQg=;
        b=caePMNocPmZTF8ew3Q/1HZkAh6u7Sv2rw74pQl6NkzugOaiNRL56OWFkgmRs3ulNUp
         0ZK3ofM0MAt/UH5IjvC2t9Ewskj1AT3tt0obOu+nMdvv3q/DQN66QAvOCaItIbKO8s8o
         SemTzQpo/0TKovEOcZndkSQi46BcUrYlqqIc1kskJPGWB4f/xs96gJHGMApLVzggRhKZ
         jF+uQxNuwWXxbOlhtD5aWz8No07emfRcKDME7ux5yBfco+txUGugf9X1wjTGZW8uTc2M
         Pa0GmsQ11+fBOCpjG/qP3eDHmY1hR0njyeIFiqKLF1jdK7jEGKlthaVh4Sb7IjaYJp2W
         dnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910106; x=1795514906;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71/VVXS9BeuWmakxmuuJ3siEvp9CNaloZsNO9/RiEQg=;
        b=CUrbFCQRzefAHRvnRfgnfwwLPdz/o+Y86sa0CywV4hiUtqkYX0ulsPiL6JLWLnDvjf
         5139NCSUkIJnqsC17Pxa/orX9K+je3ncbmuNgfNka+NWwT3ahbuT/y6yUiB6kdpCCXkM
         LVEw7XzgDcBrX/Iav5C2hXkWLXkMOICGwQ5rj1VJiPvvbQPTs9kCxpiJfBf8LK4oht7z
         cvBjOztnFXkPcZP6ELye9VQMNbOZCBqh7qQWV7Br1szibL0bB/DtpYrOpEBgrLtBbgf2
         QbJVvLrqtEfEtYve12PKpnByeuDFdlsU8xgvoS2RPeJmol+aPupNvh/+eVr3GIkeLAZb
         VcFA==
X-Forwarded-Encrypted: i=1; AL+hErFEUt0eNj8vq86m9WQ5HamO6PU/l6Y1DsA1kSqaYPjaiPjBbg66u2HXgv3r4xg4EuR4PsHidCJSdBCe23A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4HUjCKVEsuGMZWxfWP3iP8BVcvpzjLkXHZZB7YqFWlqZd3Qy4
	FLN2UzSOsT1USRb2Uwr2YH0n++gRnXXK01y4HKGKUWy1c7C7V95rgvdtlh4glRZZ3hoeHE0csn/
	pLOUYqBEW8M1I67XXbKF5UZWIwIyQdCM4kHxGZnshVNppsm4qo9x35nY9Gn7E37TZ32c=
X-Gm-Gg: AYBFou0RoH0QSnOPueJ48o35nbBqXM0OCFBO15DCN8TMjkQiENb3qiTw9+H9wUdYHiU
	9/sSg4aihmNveQ0ZSSyv8yrIxwm2NaRyu+Jdb0JBDMn59kFh63NXxF+KOoFQM/MR2wWRsecpxA5
	Wy6l6JFxRrZ0ldCq26Xugiyfp0fqLlqlHk9N1KUfST+d4E4+hqBve6iCRMCok9+4SqRTksXJUfy
	mfZ1G4KzX1OJ2dkrMc3UIu9NG1hnG+BqhZ4JJTWrUV8SDwSY4EuXp4Rw3HRY3NqmLCbIRyznXbr
	zRTo4M2OCdtZuW867XgD+Ks86xVwhRRpVh9lyExQt8oye45wWRdU3IYNwbhKsswB6K/6BzlGWaI
	A53X0cJWdvKA2U9MTRFCM4LHpeT/XBcIrVnd6Q4aSm7BnCyUvHa2sQSP6mS/WcJ8+
X-Received: by 2002:a05:620a:45a4:b0:949:75de:b22b with SMTP id af79cd13be357-94975deb4d6mr1050249885a.2.1794910105493;
        Tue, 17 Nov 2026 02:08:25 -0800 (PST)
X-Received: by 2002:a05:620a:45a4:b0:949:75de:b22b with SMTP id af79cd13be357-94975deb4d6mr1050246485a.2.1794910104932;
        Tue, 17 Nov 2026 02:08:24 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7813fa23sm69006895e9.2.2026.11.17.02.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:08:24 -0800 (PST)
Date: Tue, 17 Nov 2026 12:08:22 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: eliza-evk: Enable iris video
 codec
Message-ID: <butvfwbrzocwbiftgdssebxnlotirut2e4ub4few4e2am765ju@w3xluxibav3h>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
 <20261117-add_iris_for_eliza-v3-5-02a55a9272ef@oss.qualcomm.com>
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
In-Reply-To: <20261117-add_iris_for_eliza-v3-5-02a55a9272ef@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MCBTYWx0ZWRfX3LiHl/68zdpk
 cdRbM+GGnhAcPsNIrfiKNATLa+KtGPV5WwJzPqVxADrLwLIx0W7P5uNpQWarf9AYf/DsdutXHEs
 cQs6EN9szOX2jLefvKf0BybAHbc7AB4=
X-Proofpoint-ORIG-GUID: sN4lwytZvIDozYPSbfB6Rkq_ouiURVCX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MCBTYWx0ZWRfX7rA9E9g8jjop
 wzy9a0jZ3smxnsxCk+8DGexR1AE7pjfAZ7I4y1rhJJTLoAY0XokSssFZ7+eJ+KUGU1e1GMpcsjB
 KAFZf1vp9JjL90D/qATu30Z/qH+viG7Qw6l6j4kp5tfDX6lkpck8xSYi3frDH+TP6aFUaSjVd5/
 aC3iWtAbfU4/i7T5i/Wf46aPt5+8cGi++0D3KJ3Rotwi59FHoBTMu5541LuOzRWYYqIenTvs0eX
 4bxatk9+tOjHbD0sR9CpI6sfyWYU1J/izR7PIeLugvrxyHr7TLiWaMbzhvHh933k1oTHrOGsl+e
 nS88UjZA6VX4E48f5+VuHcueGILJJenax/F6Bl3Uzr2yQyUgLHL1Eym2naP5aLwpTCfvCKixkKd
 BLgizf/lwgmJaxsDmXzBFbCvvfyLG/dTFRlq5du69X4X2yeKEPzbVlBhvn47CvwqqmVv60o18Ik
 RhoZhuuTa2EoOOV5rgw==
X-Proofpoint-GUID: sN4lwytZvIDozYPSbfB6Rkq_ouiURVCX
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afc279a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=EICV59JFKgBgiyABiDwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170040

On 26-11-17 14:34:34, Wangao Wang wrote:
> The Eliza EVK includes the Iris video codec, but the device tree leaves
> the node disabled. Mark it as okay so the video codec driver can probe
> on this board.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
