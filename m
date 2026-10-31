Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793468757;
	b=tGvLs7BXmj4eWUZ+ANdLzWVvFgKrOpYADfm3CnYGhWp0ZpYbR61rqeL9q1hO81/v4fBl
	 Nv383BWJkhTYuPEBXHBRpia+RIy62kq06u7xcvsQO95YblGICZfa2LlVZlrEPo0LYprRC
	 o7XfUU7fwW8to4KyU9NLY4WtzIpFPCDDCWC9weINM2JTmIbqNqtd34trYTG7Agm/Tyo1K
	 jbJvhreNgsxdtWez2JD3PwrDdxdZmG8xA7DiIdZm80LNhoGRcnUMHGWTvWdxz1l/90d+S
	 FN8o8805wKOGZZ+4hV4usrCWBmiXSiFaxM1PbSN332aoZrCmJB0amsfajqjsFWEoVRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793468757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=12TO2e0T31cSdEte/htfI+5i3smqp4TVqWraSxvTy3w=;
	b=EKeZjPOz9VkSHp9997ZebFA3k8wbIhsLxNjptYn1J9Op+u1o6Wb9LWgaIFkxF7hKZ0S0
	 ef8yxSPVwjg/JzNBy+/B7xUspn4U2PeQJLg2gwAzeQddOyXBkNRxtesxoF11S//VcKVSy
	 BvFtErex8OwxY9HQI5sqRSKd0/gpCXXUu7jj5U9RbznZajKXxx7wkY/f4nFanIGqyBRBp
	 LZLT6NH9IDUCxNr1r1utB9Zc8dscGZv7VPQxB+yH1eABBrofsOxsU7TE21M4O+BJuC+SM
	 uCnNW+ugyzl3bFdMvEW2mJS18skPEkuEUbZ6NN/Jc6xCFLAUelIv49ihkXmWDHS5zbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=jrv2nOZ1;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b="neP/A2aO";
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE598606A324
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE598606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=jrv2nOZ1;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=neP/A2aO
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VDkRrD969434
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:45:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=12TO2e0T31cSdEte/htfI+5i3s
	mqp4TVqWraSxvTy3w=; b=jrv2nOZ1hp7gZbhO1vM3/PcfFfO2Eo+JrSCQRcC1ob
	JZIOAFdqM7Cv70L7PuIETHnhd9trPMvIE4Vhr5Ze645lh6+3Z3Yyu4d6HgjnPR+W
	LnQeSKOap9tnbXCFr2Yu+24s9nG4SHxLCy42p6uCdErv6i+HSk+zX7/YTMo7Mmyo
	X56d+LUijffqg2f4G3pQC6yxJs/PWK5DGOYbNI1t2gXcFbRO6bSo1OdlXPsvhW1J
	dRz2RdOGf5rWwSJFVdPkSwT6YDcnZiNKaiOWQrdff+vERJPAujUGw0u8QERN1//v
	tFTTHhwz6oVCE1EidtJ61Jgic9T/tAcuIp2psuzp8EXA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hn2x2vn5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:45:54 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so359367085a.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793468754; x=1794073554; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=12TO2e0T31cSdEte/htfI+5i3smqp4TVqWraSxvTy3w=;
        b=neP/A2aOSquMz2IRM3GwjWt3KSLmQ+sHBLc0gTN024tS1j2Ga1TlfzM0rbhUpalhBb
         MaMW0UySxvH6gCKTLWrXP1KvoUMJMyxZq6Kh87F6QViiC8q1HcJrGWj491QxL2ztzQid
         xYUcuWjDr6H5ykt/DYN3+8zpB3VcZ9uhk/KMyB3bH58mz9r3g4a7L1if8mbhw1ERRZs7
         29JUjpUrRNh9L/MmkOIbrleXFGUhDt5/NDUouq/1mRCJcYqL+EtlH0zqjLJ1UYSvL76p
         UM3mdFlMF1wfPmxDpHYtD3dXpRphcm0GeIwJ1geGp1JFt/9ftzdUPzhDxbSemzHyklBe
         PK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793468754; x=1794073554;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=12TO2e0T31cSdEte/htfI+5i3smqp4TVqWraSxvTy3w=;
        b=TnJtC5XUauKrpURuNW7Qrk94PuG5aDeEjr6GmIKR4nNAIiMnrdb/zafypiBfvuJa2F
         fak57o5ILIezy7zlS/Ru4cSAEoAgbnPMxwgasdtgYnZmuNPZWB8zFadHas2GUTtIrn+B
         YgzruR6RE7iVN2Kf5F3HGc4l8//fra8fpnfg4tI4CzY0/bnPbQ7nL8gyn1vWW+btXmrZ
         zcW+5LwbcilTGV3Jl7YyqiWLB5YuAeI63q873zCF7nOkDs1v9G3+lQSxgXoFgcafhPRl
         jwk13n5+whAGD79JywPFdmO4aoCYW+NniFfPyQ79UWPX30ssDHpEq0YZVZt2M5JRZvzK
         CUYg==
X-Forwarded-Encrypted: i=1; AKwUvBwj9YWhF/sOIUFKlpy+x95hH26YnQSzKF3T+trVsC+IDlZcf6ga1srmLa9rAett2/fKWzCxEGV8p/4qlg8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxIPJnYuvBkYbNnALJb/dSWuyd03ClRyztUmvxLP/GMNJM82kL
	uUsaRJbVdAIkykHbHPy4apHWGGqVzlxG8VLpI+cL1sQWhN7jEegqhTDxfayjbOr47vS76Qrx5z9
	N3PaYanBgYmjKLFN9VvaluD5XyH6szNev0BSzEiVXbJqkkvFJIsbOOOBbyOnbvQ==
X-Gm-Gg: AYBFou1OqO6rD1neTb9GP95f3+l3gm8IaddbTrqc5gzKTOorv/dYeYVPnWG7m04GQhf
	scorJyNZ693OzdBbgE4r64zN7sGkADSCldzWALumk0/KOgUJWDXsgBWtk1/3hBpQYVmKuA6Z8/O
	q6VtIFG66FquGh8SKxOEJdGd4Fq4JvCo0Ouaj28DD85RBA1r3cOQz6VO/tiYHRZ85EyWETGeH7o
	khfBUWizZWw1+4WW8LfQNsrRsdkpm8bzwMsaJ9Ku5+Kndkp2Dl8RsbaYnFEO9yuN1MaoMt6cUxL
	fTltWNzs308J2WhYKs99qiMQqPau3YwsP3W8ydCZUEIjFHX8G5/l9u9qCWePR5351vA9F3pLbgI
	x136f0MyEGPf5nKEBnlbS3Q3uVx787sg3QvmwMPZsL5pDyf0CyGiT+QTaLA==
X-Received: by 2002:a05:620a:270b:b0:93f:565f:e40 with SMTP id af79cd13be357-944217dc91fmr882365285a.65.1793468753912;
        Sat, 31 Oct 2026 10:45:53 -0700 (PDT)
X-Received: by 2002:a05:620a:270b:b0:93f:565f:e40 with SMTP id af79cd13be357-944217dc91fmr882361285a.65.1793468753266;
        Sat, 31 Oct 2026 10:45:53 -0700 (PDT)
Received: from [127.0.1.1] ([37.142.159.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b79059sm10220667f8f.30.2026.10.31.10.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 10:45:52 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/2] vhost-vdpa: fix a pin leak and unpin mappings by range
Date: Sat, 31 Oct 2026 13:45:33 -0400
Message-Id: <20261031-vhost-vdpa-unpin-v1-0-94ffc9683256@columbia.edu>
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
X-B4-Tracking: v=1; b=H4sIAD0p5moC/yXMTQ5AMBBA4avIrE3SSvxeRSyKwVhU06GRiLsrl
 t/ivQuEPJNAk1zgKbDwZiN0msCwGDsT8hgNmcoKrXSOYdlkxzA6g4d1bLGoiMoqN0rXBmLmPE1
 8fsu2+y1Hv9Kwvx+47wdX36AmdAAAAA==
X-Change-ID: 20261015-vhost-vdpa-unpin-68ee785a019a
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Si-Wei Liu <si-wei.liu@oracle.com>
Cc: kvm@vger.kernel.org, virtualization@lists.linux.dev,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793468749; l=869;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=yEsTLW5bz4gADvidYrxq5nthN1/BGAv4JgsFze3VSmg=;
 b=jeyY9hiphQ8blprG87I1oONkrIN8Q7ZL/IGjRLJbSRY/hU0x0AZTh7Gso9PmhW412uIWzzlh+
 JxQxyJSbDs9CNUNDmGS7lxZEUsybN2nVwItY57qixt33KLSfa4cYQmD
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA3MCBTYWx0ZWRfX9bskLa6D7BFg
 UbKRFYNyh/EFEErXFJZRvdbQxwYDr1d57QQ/TMXGVJl00zwUggF8rfyReqTFc4DDpNVoTazjd1b
 y3LI6WFjo0TBcG99v6RfsYt6uGxem8PY4TwoKfukKZXFA96FRIEDc+Qy1CqrmWFUtzLWfSLSfD0
 WhtBJLzMIOrWEbBQujZWVQ6V2PSlxptK+yFAzQRCn4z9enn47bapSmNOLtMkF3KB73+xMNrAj5U
 Hi6T3YWiahT1vhCXiN3LnqH5sAEuF8+4zwZD0F6NfslGg9Fax50NXiOi5KoiVA/hHnxT6UXE7cY
 rVdX5oHEhwTegEQe/5KbBu/BHZshkNpKrx9dF2h9G/7lgX76XnyeQNvBk/YR25GqVLHIUoptUNl
 L62CndTqty3jPypSIbx7WXUzDUDKKOtqgxmCxUJ9VhlEPFb5oyXlnZOdboLGf6CDiXNQ7q+V09C
 MtZjkpHxakEzFlJmMUw==
X-Proofpoint-GUID: 4Zi340jA9KtdQtBtYA1cJes9cwdMYHKY
X-Proofpoint-ORIG-GUID: 4Zi340jA9KtdQtBtYA1cJes9cwdMYHKY
X-Authority-Analysis: v=2.4 cv=YLMKWhGx c=1 sm=1 tr=0 ts=6ae62952 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=P+xgYyhW+KadpqoI50EQPQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=mS1D9im87lyf6bhA-bcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA3MCBTYWx0ZWRfXzHX3VcarZVyz
 uaGHIFDldQBcxm3i3rqcj/wq78DUHiOVypsw6R1gCPM5+O4CblIDoa7p04YUmBf14q3RZ4lAJ1b
 EZuhJRdAyQG2/tgvHY8I2yjw8SldkGSfCljpu4Tu8w9BEkcrqEN+
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11952
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=10 phishscore=0 adultscore=0 lowpriorityscore=10
 priorityscore=1501 impostorscore=10 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310070

While testing the second patch I ran into a pinned page leak in the
vhost_vdpa_pa_map() error path. The first patch fixes that and is
tagged for stable.

The second patch unpins each IOTLB mapping as a range with
unpin_user_page_range_dirty_lock(), which marks each folio dirty once
and drops its pins in one go, instead of a set_page_dirty_lock() and
unpin_user_page() per page. It removes the last use of
set_page_dirty_lock() in vhost.

---
Tal Zussman (2):
      vhost-vdpa: fix pinned page leak in vhost_vdpa_pa_map() error path
      vhost-vdpa: unpin mappings by range

 drivers/vhost/vdpa.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)
---
base-commit: c69023b5e16e5ffe9368603dca76d85bd544ee57
change-id: 20261015-vhost-vdpa-unpin-68ee785a019a

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

