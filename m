Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C83936493F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525060; cv=none; b=E8Vxgws9kE6ZCZHrM1n1m0LY12Ihd4CJOqo55kU6s6/r2U4MpLP2srl6VUHGB9zo7ZD+4VCep7zSI4ForOZYSp21257G7HOjXUdVL7k+vrW01YWCbQy9HloPIDkYctE+ELwCzW92Ceqqc2/NNS7RMjoe9RjaCDmDl0qB92y1mCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525060; c=relaxed/simple;
	bh=iof1zXb002NaOqoYzc+ExFqbyMk3w5l7UWEzjQfpIEw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FfjhoB3a7oMzYSLXPD3TOrtegREU7CckkBjPsdZesfYHXBbB9i9VBmpB+uShUepQM86PVcij4g3z+wt+XphqQde6OTwT159wS6lsWXLGXJV2WodUb53R7Xre9sTq7z+PTMvLffwAUkcjG6wmz9GcEnbCoR+WjW5HpzP2VBLLh30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ma6aZsWR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AEXfMr8R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ma6aZsWR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AEXfMr8R"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FNcjkU1579752
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dTwXA+ejGEJMiIPB+/n8Ge
	EfGidhGnX195FHDBlCMQ4=; b=Ma6aZsWR7CSX5RjGin0h1tUoyhDIW8PEM+r+zO
	aBTBIM27+C0AUbwKFCZzoiL5IruuWpWgWOhRfnI/qNZ/55dzREhYJhZ1L3O/GUyu
	jwktNCASxHpEmmquBox+RmbdNNlGtjkxUXMNv4gIbQxy6GZTK0SxwLDMcOJz2kBj
	RU+z6sfKaN6sJVRE9VJxm/veiOdb7FMef/UikfaPJ5GPBKOVrzC6hh4OsltFAhS8
	xIeY2FPbWPnY6sbETDpRhdK7fcyxRxiNQyoIE0jhIjzB2ck3KsNltGKrP2qhDE7z
	op6CqXWBeFDxRuL70+Dli2kWP+s4hX5qZOfIL7mO3fv0z0Rg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfge4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:17:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4bede5bf2so426219a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789525051; x=1790129851; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dTwXA+ejGEJMiIPB+/n8GeEfGidhGnX195FHDBlCMQ4=;
        b=AEXfMr8RoO88wd7FrPEy+w/3nS6fZ+zkrhIF7td8fevDlEilYlPwmJdF1A/bdH82CO
         PZDcPJBQHwb22TgMxAyikJaHtMg4DDrOtRmUwyx5GHhLbzpjNg5NiZtjRxggYNcFiyux
         lMnBLJtziKokxcPBGN/NRNe2jHlosmjTGR641dQpj9U4mtJZbOJ9L4BHx2wAUH2zEafP
         u8f6o1fD+g3qzZy32dM9ELWWcbPd4pensP5hTpZuh+EZ3oQFoT/BP1oX1MqHq8Loovgu
         Qs3bIRwKo71WKlr772nTPcvIO0J7F5ENMimyReno9T6Z44/rOPyBeJgSB1QEm2HHtlF6
         kobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789525051; x=1790129851;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dTwXA+ejGEJMiIPB+/n8GeEfGidhGnX195FHDBlCMQ4=;
        b=mjfzIkp1/0rRJkNbZ+YzSU4OXbF6Aiiei3GA9ObGU2dPws7iM/FBd7Z3558L9lYN6t
         xGcYgIi71u5WB7tMLyxVQnN/1JnqgWyYb3vFY5v+810kqECGYsdB6SP0XKN0WJJuMIzV
         NGQfcutEUZZZjbjRTCu3Y6dNyqiaNhtoS7ezuxLQ/rQnE3IkvcTfEmYGK4gukovoW1gQ
         hIjSmhVaHC/k3Pp/RS11bn+312UCwNQ9WGNr3fqLSwQy0f3E34vSrvOyiVfIQ6luWjyc
         8eHlmhIZ4fzlV9B6CyPTVEg2edoVbQNlfqbkkIv0rD8bKB+k3PcFGcX4IrVZU/gj9pjO
         vMQw==
X-Forwarded-Encrypted: i=1; AKwUvBwAIGtvBvrQLV6OY51t5OrtPLLd6WLSb9gWrBQzB+/7jtMfXh5t1F0hGFaZzRYSxhdtR9MWezNqG3I8CY0=@vger.kernel.org
X-Gm-Message-State: AFuF++k7FN5OdmWPx/OMFUx8QrORNkMlwMJq72W+eLzuwm7iTG5tSAgT
	siNNVC4IA0AUEdHuhg7EqHP/SO1XffUZkZ2y9fRgAw/JoRZaYLBmU4r059cQjxJGb1m3CvzS73E
	7bfqGxuIGL0inOjeZg4VhZJs4GzMXYzl+KLMb7sa/9Nxe5xkTqBTFlrxvjXdlRvnhIzrQU6I7/0
	E=
X-Gm-Gg: AYBFou3x8s3oxmE6mTZeZT2vzDSFAqz0dhde/ENTGmR+lQXI7M0qGvzK2ArJD04nU5s
	cXIY1ElR1sDq/xlziVc7aKKBgcsJ+AVPa495hvzFgBXwB2mYqMMf+DEAryNvXPmNYPHA3Kf6cPl
	NeQ6PG1d80r59iQQPcCJz5E5Dy6YSIt+cZNGXLO9TaSnwvLY/uOyGSH5h93B1tiS1ufIiNz1yHj
	g8t5b1fV2TDTkA3j9KTl1VL0iOvE1WB8w5X7P8hqgQtg0VJUVibTp3UP4xTf80S6E6nRbH9+ryQ
	gW4Uilbubw0rQLLj+c/I1xbDm9bMa88/pGNbsLiR/DbeFVlk5kcrcnWmsYOlGEshM/13K/Zon7X
	wBTXKSxAON0HuqSUZ9LqTdlVjfu98ufPfDAn3tr9cyoAH/6E=
X-Received: by 2002:a17:90b:1e0d:b0:39e:261:4e13 with SMTP id 98e67ed59e1d1-39e22510289mr576182a91.3.1789525051480;
        Tue, 15 Sep 2026 19:17:31 -0700 (PDT)
X-Received: by 2002:a17:90b:1e0d:b0:39e:261:4e13 with SMTP id 98e67ed59e1d1-39e22510289mr576140a91.3.1789525051042;
        Tue, 15 Sep 2026 19:17:31 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad9ed5sm3200332eec.22.2026.09.15.19.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 19:17:30 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Bluetooth: btnxpuart: Simplify ACL handling and fix
 skb leak
Date: Tue, 15 Sep 2026 19:17:16 -0700
Message-Id: <20260915-misc_fix-v3-0-31fab8976ac1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACz8qWoC/22NQQ6DIBBFr2JYFwMoFLvqPZqmUYRKU6VllLQx3
 r1gNy7cTPJ/3vszI9DeakCnbEZeBwvWDTEUhwyprh7uGts2ZsQIE6SiBe4tqJuxHyyMMJxKo0X
 DUcRfXsd6nbpc/xmm5qHVmPxEdBZG57/rr0ATtzMbKCaYc6moLgmTTXV2APl7qp/K9X0eD0rrg
 W39cuOz6At6lK0spKpKseMvy/IDFWa6VfkAAAA=
X-Change-ID: 20260913-misc_fix-6f6f518fe6b5
To: Amitkumar Karwar <amitkumar.karwar@nxp.com>,
        Neeraj Kale <neeraj.sanjaykale@nxp.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aa9fc3e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=jqfNI8RexKxqlRSoiHwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDAyOSBTYWx0ZWRfX/xlYoxzLBTB+
 v9ta7Tr0S1AybzwZo4dLETAbQ49dNJUkCzs0kkXUTip0LpC5zjGXPehofcUFqsjuSDDaCxqYC9d
 0RScYESDIldYvMdRo36pzDtyVUceWEcpbZ/Yx7GTSxIbVEF0PblQU3dYFGpG3mcM73ajzfO+KxL
 OTyquEds5FR8F6dxkiWcYCA0RPTgKxze3rIJpLBS717nByZuYb/mGeBhkX8Khbo/bIe+u0mYgCb
 N+yFrTe7BvNVLxw1q+6OV+IBEm6mvBdCAYDQl+D5/lQmbwLiLarfzVZ0Z95gpRG20F60R+z4YCV
 D+i+sZcPpBRcSUHuuC/gmlMaAy1lKGcYSF7SWlgGSXxTP4TWcQj8jX5QrKJRfYV5jV0eX9ESaXB
 H0kgFuVK1cFWcJIg/xhg93FT5nISyjuua3lU4wCnavVsowrG2w1aBwfYTFb9oeUtIv5s3IxLQIk
 WPn1IpgLWKLWVB8tINg==
X-Proofpoint-GUID: Oig1qjip003xSxClzMn8aIgWsEs2KLF9
X-Proofpoint-ORIG-GUID: Oig1qjip003xSxClzMn8aIgWsEs2KLF9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDAyOSBTYWx0ZWRfX5EHPh5LwqHZQ
 DP/yybcTgAMDW1pi69TnelzHlmRc1pSV94JaRnmQF+y69dFLiMB14YMe67OX7xyXavS1SEmG7V8
 qmWHtA8sFyNXSeQ9NHFSBbQzPIaBss4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160029

This series simplifies ACL handle extraction in btnxpuart and fixes
an skb leak when devcoredump support is disabled, — all simple.

---
Changes in v3:
- Use IS_ENABLED(CONFIG_DEV_COREDUMP) instead of #ifdef, per Luiz.
- Link to v2: https://patch.msgid.link/20260914-misc_fix-v2-0-6178d838c946@oss.qualcomm.com

Changes in v2:
- Add a minor ACL handle-extraction simplification in btnxpuart.
- Fix the skb leak in btnxpuart when devcoredump support is disabled.
- Link to v1: https://patch.msgid.link/20260913-misc_fix-v1-0-558c1e4028b9@oss.qualcomm.com

---
Zijun Hu (2):
      Bluetooth: btnxpuart: Simplify nxp_recv_acl_pkt() by hci_acl_handle()
      Bluetooth: btnxpuart: Fix skb leak in nxp_process_fw_dump()

 drivers/bluetooth/btnxpuart.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
---
base-commit: 2e63b55654e0ea35cbc4fae20244026718f56755
change-id: 20260913-misc_fix-6f6f518fe6b5

Best regards,
--  
Zijun Hu <zijun.hu@oss.qualcomm.com>

