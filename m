Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593193;
	b=JmG73RWI1wdZinDOqscufqHrT+WcrKCY8waFG+JdnRzt9zsMmfal3ZGJgX4EzPCwbNCV
	 QUGiS5RyHON1kvKHJIkMSXH0PAFaNPfqLowD+1z6YVcHZ2iliMfoMNQldJqEWAzjZOsWB
	 OQS0o6bwYWyuWMaaUZETaayypzn8b5gVVcYR/jo89vPmLCzSZVQtVztUFmilY7EQb2iiw
	 dgsiTPm4mkrM+fVN5yQNkfCyGzg/whTRltrnn2L0nf8uPRN6pnXDgLgSE4vyEdYgVTHzx
	 wAlU3OQX1wFCFUTOPD+AIQ1YVgKGrzDjESqrmvclZZYANP3/C4mzYkIn3A70NZgLQUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rT0attzH75pVivpmDOXUpw4nbiY5gyDFmPZRpVhJyJA=;
	b=EDJfyQhevRFGovopWouuFeox4GzGuJm0NiSYFYYyoxCThRERvMPWXX4rwdxOBY9BUMjF
	 W6eftRsrYXc2TwRafh2qTPI0WXoYYUa8zhno8MsYFwvvUbxCYRFNH0IlSHhwya/mH+GB/
	 JXW7+c3CDVYCweth8z1tyLugFUmNqrtF3Y7PuY/6m1K8NzPCU+L0+vqYxNRD05B6UVq4h
	 +8k0nm1qM0ISt4Qm3APiXoj3mIUuvmCJbbQE4r0zlc/oAMMQHIJeKgbl9uJn3yzYbOVus
	 AygafIlJeECXuAZL0zXGRry64HQf7zNv+cLV04YYEybcp7aydXLUEJu7yEU2Ig3UMHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=WC4wSCQ8;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E513606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E513606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=WC4wSCQ8
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a06b436dffso354271b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792593193; x=1793197993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rT0attzH75pVivpmDOXUpw4nbiY5gyDFmPZRpVhJyJA=;
        b=WC4wSCQ8IBwhhl+eC3sq5GnHMVsUiN2/Qh/0fQ2HNj7a5ZjnhjyoxMb960eGoVE9GJ
         4F+Q+N7jCRk3Xao7tzIO8i8dLQNoNLi835ckMZT4lZX3/Yw6jGrEz7cuOEXY6C9rI5nw
         HlBpLO5UWS+MhHbS24Yxgur+B4/pO+liQoM6W17S3ET3VbEWlDtHRBcYAlPlgVKm81E6
         EdvVwB4kW8r8eWh0vkFhORiE34VcBLAdLg5OhRuOTKdelrGqjSeRTuew6TgYn23YXruS
         nVaLZExLbxQtw9k5u8gifNEGRsbxlVkNSxL17rDOP5UsYAA0RuH8ymF6nxyOAXlRlwkM
         Vcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792593193; x=1793197993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rT0attzH75pVivpmDOXUpw4nbiY5gyDFmPZRpVhJyJA=;
        b=TTP/KN3/fwwS6h3LvPQ45joYNtcOg1rUWsuYPHWaVS0SNMJvGbggFj0T5treEgHf9p
         XmQWlTSmygoa3ww9SF9nSimU0Dz3mZ/oYcG4FjvYgNwOGMWP1JMkXkm6mGFt1LqDPIW/
         BWqZ2Z0vmXEF2Rzy2+wlKVa4679LLFWrm3eT38jTwgD8xkXyyPrXmVRjlb1Yx8qaP4Zs
         /ZmR9cTnVPleMpy5ekDfNbjGuPtwaKcPC09RvdnhUf59F6Uo8C+FU33QHSfgSeaSa3gl
         orwDfsOpd0+zA/JDBSFaYeRfbboZhyURSwJyVJkN5VLhzMlDNX7xeB0BL02qv+U49p2M
         pG6A==
X-Forwarded-Encrypted: i=1; AKwUvByxgmeZXqidhL+WDxVeBgAjk2In7HL8XUhXTv0P1uYy4/RmIhmqwmg/TZPQqSG8AuSlAEqPiFJHNSFRzw0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKG/ZlxmFv72Ykp2jE76WK2r5EYrB9m/7rhqYIf1M7WsutMOPIG
	hp1I3xWuXlif9cI7exH1XfX5cPge2QutRNSYX94xdFulYEisgqIa8I/KylnhLRs91oA=
X-Gm-Gg: AYBFou0tNHq9GJCIPwC8IqNB5N/ONaWvE9QNqKdrXXcHMKA9sCu8/vZuEsBhgMsX2mB
	GPVwMRIznuleiK6l1snoz3U2NdyQuF6HpSCwvLRjbcwxUtO9nkhRCCsJlcjREJHy/r95V7fh6+X
	PEIJ36VNdEILVKFSRtcUoAI9AhtoZLNWJunozOwojsuZJ5fJ9P/d9bRP9g4ACgxqb+xzIlvpcDR
	P3dWwqBKPvSTMsAjuU609F9GqHWqvSkGxyMP8m6sSYZtL3p0fbaeOi3Xi3ZcZjIACT6i1GXRUvA
	fASKpgl+ctR3q6O2h5P+jl8uFKgOOThDuLYIEDMjJ0cOtLnNoF+AGsj7aSWvgffoAvd1vS+my8h
	ulRz9g3yISrmOEqz2a4w9HC0o1r6lQUYkFlrmFrnBoum28W+KIICmZCt/0VPM/Aevjflv/tNFk3
	1Hn6EAkfWBArL9esE8qt2mtvMNW1Q/q5Wru0IHbZ+qu5N1IruTt9rL8LLfAmeXnr6uFwx79tNCZ
	2LXil+ZQWFeM6VwZRzU7iHe/HFeM521dYiO8x6QR8V5VOt3NdWC0anE0DZwSRCQe2uqCpIchF5F
	Y5E=
X-Received: by 2002:a05:6a00:17a9:b0:881:be70:448e with SMTP id d2e1a72fcca58-8a089ebb6f8mr1941007b3a.53.1792593192467;
        Wed, 21 Oct 2026 07:33:12 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:2813:c015:8111:4bd6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895fa967sm991720b3a.47.2026.10.21.07.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:32:58 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Ram Vegesna <ram.vegesna@broadcom.com>,
	Daniel Wagner <dwagner@suse.de>,
	"Martin K . Petersen" <mkp@kernel.org>
Cc: James Smart <jsmart2021@gmail.com>,
	Hannes Reinecke <hare@suse.de>,
	Mike Christie <michael.christie@oracle.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v2] scsi: elx: efct: fix target session lifetime against node teardown
Date: Wed, 21 Oct 2026 23:32:40 +0900
Message-ID: <20261021143240.2782323-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021130802.2691833-1-yhlee@isslab.korea.ac.kr>
References: <20261021130802.2691833-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review. Two of the three points are right, and v3 fixes
them.

Both came from the backend reporting a synchronous completion while the
setup work was still in flight. efct_scsi_new_initiator() returned
EFC_SCSI_CALL_COMPLETE for a duplicate PRLI, and efct_scsi_del_initiator()
returned it when it handed the in-flight setup to teardown, so
efc_d_send_prli_rsp() and __efc_d_initiate_shutdown() advanced the node
before the work had registered or unwound the session. v3 returns
EFC_SCSI_CALL_ASYNC in both cases and lets the setup work post the one
completion it owes, through efc_scsi_del_initiator_complete() or
efc_scsi_sess_reg_complete().

The third, the window around efc_scsi_sess_reg_complete(), stays memory
safe because the work now holds a node reference across it. The second
efc_node_free() it describes is a pre-existing path in efc_node_free()
that this patch does not change.

v3 is at
https://lore.kernel.org/r/20261021142818.2782104-1-yhlee@isslab.korea.ac.kr
