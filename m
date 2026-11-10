Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794345823;
	b=Wu60/pVb5P2daS7c1uaXTcBeGzljeRFdROracyOuXPcjjwxgGxE/fZ7XXfp+Pp+mEL76
	 nlSdhXoZianpFdqXwK4/zsMX7vY3FNe+6OLdgpvNp8QLiAlX4sYmZh+LHCvoXnK2OX0gS
	 iiI1YKTD2ylmeD6ZLqg9aLT/AZvtXFsqyWhIkcaX099cAZcgfXIHwoB77DrWi3Z4+X7gj
	 MLPQSb6tGf5No2tzuIvqXiZP6PhfB9zjfsxD9hmnpVl//XqNliNRM3JFyRNLhSlYxShdr
	 ZnUcfXNrbcmYM1h3Yg4R9JJHGdKz4rp8DkcPtOrVeLhN1DkSHnUJ5iXAxIu1NQSD0Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794345823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AFWLtP5kiKPMmVsklHz6N0uEqo9lqJb+MRW+b7VeZ+0=;
	b=oUErGtX64XxGlI4rCZo4yETRU2SRPmQj2DhslTrSOg4+qboWPhDHBoWaFs3StN7JGBNA
	 m0aZvqcMwCkrosQzrVItIg1TK0jdEGFzwdapuSKAhXVm524Fuc6CJWofGPlIvwvvsKFSv
	 9kADUjTADJChtxr2XSj5AmA2aa41x4ONKGKwKMliTHhAm+CGioAKH4vffILNhAieK+Qh+
	 Je18buPWcAe4bBadpGsV7Kvl1/TTnxwogpeXe0h6oDOWdKE9uNC8FV71d0amPh7EtWboY
	 OpXXmTD9b90U+mN99B/2HQH4yHKY7gOJrtbcCr5btoH9o2/HXTUM98ITvmL/kp1+GHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=nndiHop+;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=d0roIc0X;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70686606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70686606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=nndiHop+;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=d0roIc0X
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAKS4MQ2243177
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:23:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=AFWLtP5kiKPMmVsklHz6N0uEqo
	9lqJb+MRW+b7VeZ+0=; b=nndiHop+pJB5gWcqgn1Z4LLq1L7RuWoaRk8nKvy0mp
	mOR73xNyBTSAdlRzgcdXCiP4OIlWUe/nMwJ7GXyprtH0wlnEf7gFanodd7drZ7Aj
	SDSsmByRzL4aomnLOy8hDU8IbSCT5dGsUK0q4MoNU6ijZaXfj1HbnfIILqmBnosc
	brshmPDomf51LVrG18Zk/9pt/DLpGibimJgxKxavizx5nVc72CvWaGjSzEUoHA0o
	Km3fasyz6cJmvet6zB2JA8kGI0kNzL97q+6Xg4uHSuJjmS/Z8fYUjhE+7q9uk739
	2x3tXG/S34MzYbAebe6LgtN10mFkerkzoSlZKffsovaw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hv4cn4jp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:23:41 -0500 (EST)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ea71789d8so66674856d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794345820; x=1794950620; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AFWLtP5kiKPMmVsklHz6N0uEqo9lqJb+MRW+b7VeZ+0=;
        b=d0roIc0XsD8WFQAsMNwmg5UnbkEetjZZrPzKuzwT+Io+GLxFinqhurnFy8rR9tdSvR
         KmfXlJHjgoYXGkWVt+ml8JOzOQgZthxtaMs4gDAoYnK9AylwjdTiE/vob3lrxY8OZc4z
         We5SjeuWHfpz2xg5PE3UDLHn2DNrpTAnklTevmZqS5SBesjzlWQ6pPi40CYp2Eh0D+5x
         zpeYf3ESekrv2nfRUtX95RLa+p+8DJ24rNHQoDS8z2vdT2dsHPi6tpplWlH86BFLTyCM
         yHLnyTay2v69tUJLVXaAdwtsSAgqE7X6c8XdnuS50bALeeNlscdiTmlgidjk/sxM42Lv
         dGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794345820; x=1794950620;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AFWLtP5kiKPMmVsklHz6N0uEqo9lqJb+MRW+b7VeZ+0=;
        b=WKYKoiwVfBZsvyzkDUK6nGK6vaLY91n2NJ+pQOJYyZvebjlpoailwm9lQlkyr0V9za
         70pvolUVRQ6yB8s9ypfRsv9BJ0GyIOIjppxYrE4ffOFP/JHXeXOcjn6vf3f+8DeTGwxe
         OZQF9ze4LZdKxs5CpACFwAXT5xdZviBLVU77xbzv4+GzM63z9OCpHAu38KRwIQqxpfcz
         uPnZatKKUJf1lJz5/jBcXxnWvpdDT+y6nkelEYpCixCcCZ9IoXfag8Zhk/76XeQzBOjJ
         +o/pP2O99pqV7sbebkk7qWD7x15XhGCddHUjvzbYwGf21t+M7Ex98sXbyS0q3xGZeYwz
         qGkg==
X-Forwarded-Encrypted: i=1; AL+hErHzJp85bIWQApMJXzWcKFZxLuGbpn9q4fSRmZW3l0udw3cL8WmBEYjxf+wA1uJ3EDt/0S9+u+EhVP71Oig=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xVcb9vTymYFxxP6VoYZhu2FVK28mA9rGnXL+Bp2C0+sOv3xrx
	PRzgJCriw+ArBQuJKrJg/pHatpuaUWHltjODzBmAuRYl6uexgyl9RoZaG6GS1lueFDbXpM0HFcP
	6vp7Z3S+Nr+HW7doc5DU59UvHWtknPtKl1iXteLfg2UL90J31OQfnLP0fjjMUyg==
X-Gm-Gg: AYBFou2/Xw6otRjkqMZNLV9JD+KcMe9wTytgCMDprPdNHdLlDJm3CxZESjyqqUf90mA
	bGv3CcT/H6ddXiyNEr/7/PI/Li8f6zM/h1eTqdOQg8f5+qw9jQnO/JZvuTIayjq5Y7KTvbk+slq
	5wCIV/H/D+pVYBbW9GNGnAmu5zUyruqqGw8BSet0T3+sAI4kJaj0CH4XO3Eqi6Yh7HdtbG/YQTK
	hTpWArmEj77b9QR5hSZXzBSFtpuapsa9AjAVlciY58XTCKaJkIxx9Aeu1j5U9kmIpuGYtDy4kD5
	/TWdTxzzTsaGTZytaS7TLbTi8W9YGyrD4OyvfNLSq2Ys8G5WPF9SS8D+2z9KFcK07WmjfvTnI6a
	h2xWwvwTlA5007ZZN4wab3o5f1gyHtJIp0KdXV+i+LfKbFm9ejQtR+tfF/vc=
X-Received: by 2002:ad4:5fc7:0:b0:91e:a05f:25e3 with SMTP id 6a1803df08f44-91f04001c7fmr11366666d6.20.1794345820356;
        Tue, 10 Nov 2026 13:23:40 -0800 (PST)
X-Received: by 2002:ad4:5fc7:0:b0:91e:a05f:25e3 with SMTP id 6a1803df08f44-91f04001c7fmr11366116d6.20.1794345819696;
        Tue, 10 Nov 2026 13:23:39 -0800 (PST)
Received: from [127.0.1.1] ([129.236.231.168])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f00f6eb88sm10024766d6.39.2026.11.10.13.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:23:39 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/2] scsi: scsi_debug: fix zone reset with virtual_gb and
 DIX
Date: Tue, 10 Nov 2026 16:23:29 -0500
Message-Id: <20261110-scsi-debug-zone-reset-v1-0-28cb9184b5ea@columbia.edu>
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
X-B4-Tracking: v=1; b=H4sIAFGL82oC/yXMMQ6CQBBG4auQqZ2EJaDAVYwFzP7gUCxkBwyRc
 HdXLb/ivYMMUWHUZgdFvNR0DgnukpE8uzCC1SdTkRdX5/KGTUzZo99Gfs8BHGFY2ZWDVPVNGl9
 WlNolYtD9970//ratnyDrd0bn+QHuikIoeQAAAA==
X-Change-ID: 20261109-scsi-debug-zone-reset-14fc587c9d45
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Douglas Gilbert <dgilbert@interlog.com>,
        Damien Le Moal <dlemoal@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794345818; l=1003;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=AUoD3CVvBqOYNEJ3z70qfDFWLbDBTifU4lDJRS1G0ZU=;
 b=kBrFE8REW5pyFGDTXeT8yi/q0M7OuPgrIlX3Zb6Fc4jEuKVZ3EfvpKc2yiTfIzEZShvL/vHQk
 HJdNMl8TZlTDKAI5fTs0v+aamvKWf0/B5dNBVzWwRMeGyYtMNdaqH6S
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=J6k/fwnS c=1 sm=1 tr=0 ts=6af38b5d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=lHGGv15rhlN7Yv6qcqrt9g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=aM_X35XmSQlPpTYI4kgA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA4NSBTYWx0ZWRfXwBes3rRAfqOO
 GzcPZGyHVFlRZIcir9/gt0AXpZDooWXftOkpZS6d6HXn9kwXYKjse35xmDGhlec6Exfl8E1OJDJ
 Ztcui38FsmA1YKHrq4iyoYtfkZ3gMBOSZKyK1Wvt0zxnSVYzZa2f
X-Proofpoint-GUID: 6iifJTHGHrapPHxNnP6bNpN8xJvWiq8Q
X-Proofpoint-ORIG-GUID: 6iifJTHGHrapPHxNnP6bNpN8xJvWiq8Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA4NSBTYWx0ZWRfXwe/M0SKdOpqZ
 H0eWZSqrSjDezlzoQIqXE/78c4hutQ6dRgjdl25aJYsEHxo5aC/eIJK7s3NoKVAi3G2xoj+cz3w
 OfWeghC8prF5d1G0+wcnLSxuqSZKPMmINtWt/4HpUY8wenBb+OJNgQpRzIWhHjCUe3UjFrfm5iU
 VTQ8/ARVs1R3iKGl4nEyhtewYNnZlr2zkth9mWewOqMd801Dn7Aal/nY7JoWO90fyeLefUuWeH5
 qXpPZpLtkGtpMmdGnY5xBSShkcD/G3WpNrGkAdveTTIRMF9IzJyIPmqHeEzp5b6z0Xwqcl5Uw0J
 bVYSuRtUKg/lg3mAhqkXHHGFZuIijG+TjOnYuCY5XUP7klqzezo7IgjjB9bFx3ry/woNNhMjCSE
 +f1WJTP3BB9D6nf/akTB3UqfSjhaAX7/HexrQl42bnOaCzzdHnMpH1wQqxx+RBi5K8N5507E3tV
 NXU0B/9le9aWjKf80nQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11962
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=10 lowpriorityscore=10 bulkscore=10
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100085

Resetting a written zone on scsi_debug zeroes the zone's blocks in the
store, but does so with a raw offset that doesn't wrap around the store
like writes do, and without resetting the blocks' protection
information. With virtual_gb set, resetting a zone that starts past the
end of the store oopses. With DIX enabled, a reset zone can't be read
back. The first patch makes the reset wrap around the end of the store
like writes do. The second resets the protection information of the
zeroed blocks.

The fixes were proposed by an LLM.

---
Tal Zussman (2):
      scsi: scsi_debug: wrap around the store when zeroing a reset zone
      scsi: scsi_debug: reset protection information on zone reset

 drivers/scsi/scsi_debug.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261109-scsi-debug-zone-reset-14fc587c9d45

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

