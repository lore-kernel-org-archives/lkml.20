Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793688936;
	b=PlBzDsVyLXcPcbzZU9HtzbaHKFlSn2ZpiKjHhVvzGEnOOn+3+FilFmL5lfMejWKJRAvV
	 33NagN6EftoVbR+GWWtKm19idwdm791jkKLaty/pUsPTDIhvUsuHfGYsTW8Gay61H8PBG
	 B4mOOaDcY5DCEJZAmjt14D6J7Wd/iSAsyk9RGvoUpPYXLtZL6sEkiWAAvBL/RoTRX8fO3
	 jBBAUHY+lk73VWZ1PftYSxC5Rhpd6aTTynWWk4LT9Bd3N0qZraN5ItmnZPXymP+J6tYAB
	 JVMDfqxksVAzjMIDb0vRUxAu77erYWFsvzF0FH00IGgnPz3NoYOyQzFQmnsZ2jpNCEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793688936;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5eoKnttr8d0Ojq6L5syAw5jkS+Q5yVG5Q+JQ/FVXY8w=;
	b=Vr4xX6iWwXj8H1mtasJjnwljpn/HeaSUFdWAxzN1zsxnQZ17NTRE1i+emA3F82nD85DH
	 0wPOAX5n83n0VovP2JhDVnhLrXQzzVa8PTOqy733P8153XUh+EPmjaLTl1GtycJ/6KyqQ
	 S+b4IYi47tkWlNIAKa8IW/bvqxigW1AbISnwBPLWCeeiaJyXrZr/aGYcypCkZ6p1FoJz0
	 S5gaVE5Fu3h3C4KVYF/AOYFjFaJPpICYl6As8GaX7KX8ZhLQb5RxbM30GbfRdrvoI/RsJ
	 FQa6qMVIVA4tpyGZEI+3vKQdQCAABVdJFMMoVNBZnTW6Y/jnd9ZO5kHgpUbKAYCooSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zq3wF36m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M9uVqPX+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA86606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBA86606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zq3wF36m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M9uVqPX+
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31eLgH470810
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 06:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5eoKnttr8d0Ojq6L5syAw5jkS+Q5yVG5Q+JQ/FVXY8w=; b=Zq3wF36m2QiXyVkt
	JayEmq5i5Krz/7n8QhHRoII7D+li/vrRe4ik2vEwMiEoQ/QR4//G8iHgQC+PPUCr
	9aaYHYwbfQx8Zs1fuYQ98dp/ZoFNob5Zbkx+XxTrRrSe+zlfK7JBV+1Dm89eTY3u
	vwvYZfjo1nUK3/q7TeyIyMSuI4Sd6gQ6b6N2rYh2ktvs8DSYvolbquMzsZcTrcf3
	yvEF0wtahSadCaRmbic5QszrWm2rhMqoOrp0f3QfwCJkOIcpkLyOjGWu5Hu0Ou54
	Q0c6Bs3VeiByAjzI7l5FY1MHj3qsn5X/3C3n50GTMaLVzGaNcS1qBFzP7e3Va/L4
	RrYMaw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081tcuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:55:35 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-85c1135c288so1089338a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793688934; x=1794293734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5eoKnttr8d0Ojq6L5syAw5jkS+Q5yVG5Q+JQ/FVXY8w=;
        b=M9uVqPX+skgbjtAOmwWu+ol6eCfR9UeMvvMF5h/11bhNv+Fm5Hp73uol+F7GUHjYqX
         Pv7b04r0FDtqdN2z+j9KVmCKgHNpkQdSxCJKvSbTBQ7gouVFsduAIy6X1ImxyvghAEHG
         O1W5lP+cgRgfMKT5a2nRZCWUcnlkJk4qqAyRlBhA0XYG/z57f5QKL/A44smB73xao8En
         2P9RAOoV84zjQ+fKzILOMPLMNQ8sESkmX0Qrq8//69gFTXNFgGR3jJLNhlDJ1a09/G0w
         W7md9WFy13LLAIF/oaoz6pn9yzV0bxsGHsMDLGHhzlmXS++l/dyVKwCN3ZWgG5zOUe8h
         6INA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793688934; x=1794293734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5eoKnttr8d0Ojq6L5syAw5jkS+Q5yVG5Q+JQ/FVXY8w=;
        b=Wiq3WFoChiInJiyOaGWR8ZXDoxIlSM2w5iE9K/cGMIIGrC8T5e7R0iNYH/DzQmIFLI
         MRgOPX2rzU3k7Kr29WyevHPWved6jGnPkZAIMafR2ipxOsDN2B0JdSQy5bh4tdIH6SVQ
         sP1KihKHTcoEqiojpdLxozWYnhqn/g5XHGZKiXkLElGbzsftUkYOMzXbht8YI9tI8U5B
         NR3xMcn72nZaqCJ2FWJtzEgNdPUIw8/Dg/TBsoLc+1Q9uIk1Xw2cGXdz4OmP8Pj2c5qo
         tPBj6qAWYXryt4msqsDh9qckmbH8JFBJaO342/b6E6HrZ+0oCgd57e9xjcPe9jRL7omv
         CBSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqFSllVlCkBV8twnII7PHSFOSkI/qkcqlXKuqAbwm/STXAHa3RHHWm/766sqFMzHm5P8ft9tJaoBScvk8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYlUnGXjHaH75rDOfZjsmlvxTsfAGxKWIG2V8gDUE1MA29j5IC
	3KZEajcwVMYYcQfz7xwRjQyvztSOZ+vISfSjWLMEbpiTGsoekF7GqB4OKHEFIHhg87lZPag1xaU
	r74jiHx8EH/NksNybR+bmA07/dezagY774AGmLNPjRjR4VGkW/CeEzBwllrr+pjJoqJTex0Svnx
	k=
X-Gm-Gg: AYBFou1qyT8gBH/CwDJTPXO7MMOVRk/XnAlOHlarbt/LZw+wFjt0FcReDf+euARRgRu
	xZScIGoVPhYt5HOtYIVFMco8wcAvHgk1gl0cGYcSU0YwYFuDVkcwfKKVrSk6H1AUQByezeys00K
	dUC5Fe0vZZRjjg6oPEdQpxVlwebb5G7kucsgBn3RDw9uvKIdF1H4GC5+K0o3z0Sy7TG4uoBJhGJ
	kvns64As0kp6ZP7yhDSCcj6RDMhM6nDFXlaPPwq68SJl2VcZPfCXB96JOBI07ze+ZYGB75aIJxJ
	chw3Z+oNhXtq4L25gYX3Z7dL2HAfZXWRTPwfyfHCZOBaL4yMQlZGcvYUKG89mUAHgmGTdlO2hrW
	cNIeMtbfhQ8GYlNPvWD2ecwBEO0o2pdelEH8pvWlmQi/dwoprZt4/sQwiyMAAU7ml4zr27Vz+Y9
	F5EsQvsEpo7Om2ovrIs6Q=
X-Received: by 2002:a05:6808:1209:b0:4e8:9e40:a0dc with SMTP id 5614622812f47-564101873f9mr11041438b6e.1.1793688934261;
        Mon, 02 Nov 2026 22:55:34 -0800 (PST)
X-Received: by 2002:a05:6808:1209:b0:4e8:9e40:a0dc with SMTP id 5614622812f47-564101873f9mr11041424b6e.1.1793688933917;
        Mon, 02 Nov 2026 22:55:33 -0800 (PST)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe423fasm10305974b6e.16.2026.11.02.22.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:55:33 -0800 (PST)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 22:55:21 -0800
Subject: [PATCH v2 2/2] Bluetooth: hci_uart: Remove redundant NVMEM
 dependency
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-fix_kconf-v2-2-b4bd28de37b5@oss.qualcomm.com>
References: <20261102-fix_kconf-v2-0-b4bd28de37b5@oss.qualcomm.com>
In-Reply-To: <20261102-fix_kconf-v2-0-b4bd28de37b5@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Chethan T N <chethan.tumkur.narayan@intel.com>,
        Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>,
        Kiran K <kiran.k@intel.com>
Cc: Zijun Hu <zijun_hu@icloud.com>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyNyBTYWx0ZWRfX/+CS8eYJ/Hud
 eSZTNOk5CZiNHgkEv8dQPAzMKsxMoXgHd472CiEGI56MOMoEnYBO1BbloLAKL0vj5NiGmW/tsJw
 ioLbFlq9L2gV1g3kgmj0ckR6IGorHlU=
X-Proofpoint-ORIG-GUID: qB7wSa2tn3foKVAVE2h9ctANjElTLdeg
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae98567 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4keN-7vRS7seC8qMJf0A:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: qB7wSa2tn3foKVAVE2h9ctANjElTLdeg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyNyBTYWx0ZWRfX1bJaSBvhlFp5
 g55pWgJuAbYBzBDgAmihrZ92hmwE5T/bE3kOK/YLZgRY8bhzvV3Ha/+rgXZn63QxwnDSYFAunep
 l7+f6EEEKc6N7IY17antcmtoVNFvZpKpxgEkPooV492sn+ikAc2cWEdzph0qn4O/g0V4H2SMD9+
 1bBjDv/6IHYj0BW1ivGPczDQn3b2JW9nVZXe095UOK4gRNk5UBEFPwrrT/oVO7nCTPX1zf0uJez
 lG+kbEXm8No96HdTR6RHF6xQPymAokhppr+hR7fJdLnBgWX1UCRIzbHHPrh08iGwF8xCwAaiu1v
 3tD7c0CLzqHpHw1tRRAtQKGqC7tMDJ0rokbvdgvA9hTmd/9Ls4cWeL8Zt7UDRMXkQdmpbLI+UBU
 3Y1h+vZbeXjS3hWVBpLjaqLV3AQZUNeV3xbsh4TQUCyHAzO/n8ZRD41Iqt/RX4Lrtq7jb5drXI/
 Kqhkgnsndq/HWo4rQyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030027

'depends on NVMEM || !NVMEM' always evaluates to y, so it has no
impact since the following commit changed NVMEM type from tristate
to bool:

Commit 2a37ce25d9f2 ("nvmem: disallow modular CONFIG_NVMEM")

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
index b18482b5677f..ad5eabb8eb77 100644
--- a/drivers/bluetooth/Kconfig
+++ b/drivers/bluetooth/Kconfig
@@ -112,17 +112,16 @@ config BT_HCIBTSDIO
 	  SDIO interface.
 
 	  Say Y here to compile support for Bluetooth SDIO devices into the
 	  kernel or say M to compile it as module (btsdio).
 
 config BT_HCIUART
 	tristate "HCI UART driver"
 	depends on SERIAL_DEV_BUS || !SERIAL_DEV_BUS
-	depends on NVMEM || !NVMEM
 	depends on POWER_SEQUENCING || !POWER_SEQUENCING
 	depends on TTY
 	help
 	  Bluetooth HCI UART driver.
 	  This driver is required if you want to use Bluetooth devices with
 	  serial port interface. You will also need this driver if you have
 	  UART based Bluetooth PCMCIA and CF devices like Xircom Credit Card
 	  adapter and BrainBoxes Bluetooth PC Card.

-- 
2.34.1

