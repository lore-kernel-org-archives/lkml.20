Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824051;
	b=3GSdANX8ThRWUaPGKawJ+67d3lphv2ni0OR/PN2YUhTWI9D9/b+0j1z8+tUDVcAfgcyX
	 QwHBygvf1qaKKNEm/OoXJSblPbmWKrQGhTcff+aKB41kjoGT2w/mXOSmbN/6j9U36RIgB
	 cPb0avfDyL2UUvQ+P53X3bNGg0kbry/zFPYQLvJBPpxRwDWlz3SWEIp0ylWzllEDJnDZN
	 2vGmiOtpvd+1peC2o3PXrFmm0i1WtRS8wUpHd2XkqSC9RvdVAXfCvpAiAij8zekyVxAIM
	 j7U5cO+cYqO/ZUVrW4WalG48OAzE7ex6BIOIyaiG6D8J7oTL2L5SDZBSFIwz62Gj2Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=x2RdWa2epHt4WctzJo9zXIVV3S8rmZhGbykyRTHy254=;
	b=WlYXPkBixWSOfNDQ7NL6j2aLezq9LAHkuhOf4GqqpAC2rzFQ9hYcH5VDipyYQ2+nOgrd
	 HQLO9pOdyUHlfOhfxMPtAUXj5rC11qiLsiEcU8wCwOEfFKDtTg574fnDbboutOreXvBl3
	 FhTCjIha4LjWQwfLSD0hU4Hgh4uTyCpYWBQow7EQzn8dY5DxD8rRXwno8oJULX3Y6Leqs
	 e6SUVY3sKC2xrTlXV++GwQ/RuRmzF4I98k3sSOnNjWZNfJ87WOoYA/GnQ/H4L6/msEDFs
	 42rHCCI5Yof/6H9Wfd7qfM5oF7S4mf7Tr7CG5KD3Z+CfAGX7DJ4/FO9d92tUdK/wHQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LJdVJliv;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27339606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27339606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LJdVJliv
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37198ed3727so4814081eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794824050; x=1795428850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x2RdWa2epHt4WctzJo9zXIVV3S8rmZhGbykyRTHy254=;
        b=LJdVJlivULwySoKe7RmHEPKDa8I//vM/iWsIU1h+DLgudWNXKVV6sia44lgJLI5Xi0
         wr1smIU1P9IioTjZ/neNVSRzaOfBGTfbum+dpcki4uxCmk/vSaGzR34Aq182E36yqBWJ
         nKBRncsEQKyLiXrZ6+h82rzFtqlISgOBZrHfRdNYFY/c+LamP7WiibdKv9KQYNYYl0dk
         I+bD+lNU9tHNm02lHpyK6x2f+unB8B2Vi9dcMTpKgSpz64iMNtFGOIJraXiF1/nXCHI/
         eRBD4f7OHF9uaMa7wkOWWmvvk+v+EVuYFtKMQd+y+yPnkTHgCvhQjKmj1gLoOvEP9XzC
         Cp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824050; x=1795428850;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x2RdWa2epHt4WctzJo9zXIVV3S8rmZhGbykyRTHy254=;
        b=0IEZBKbMK4jUlY75AOs3g+vsvLkJQbetftytu/IfO5mJmWIwcqhbRXTr77Uzs5DHz4
         rdmChmdIS1OakJ+nxB53lv0Nhp2Nw7Sg6j1SiCveM2kpg4cn7NbUOQiJWO9a9z+JutyG
         4I6vDbpYoBB+dJ4Hv2jpsTGxVD8iAiMOIauWG0VSmW9zOnxP2GQyoWWTuMrc3coeao0c
         Z7H0JYxjeRlIsZjfT/rxP41NFctDq8HriO22Ijf/7Mz472bpl379s2po3qUm/B81mQWk
         jNtjL0IuKbjb0IrLmz+rF1vJs1BMXlpuNhYvwd+9IMSGsknemMEyZn8vw04oq0FLudmD
         wUlw==
X-Forwarded-Encrypted: i=1; AL+hErGwqRhFt+hCIJrCQ9Gl9WvfUnp92bWY7zydosi8W3pD5syeww0mSp29dPYfBRPZnu3h6EyFHMH/nDOkfzI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A+X8X+s3kDCOVjroIRKEz/2g5+KK22fLzqhc5Mj7TDYjltBKF
	7tVTcCnnRbrGd91go7Z0jTXMF4AFR6hAl+j5h3Ig6TkGP+6eh7i26N7dpyAmosVRZic=
X-Gm-Gg: AZFdTZe3OeLmoOEPaFJHDjZNGtKaqaYCV08cai357eAm4aJDn/WuTJuQ0R6GHxnOYHi
	Nn4DuQgeAnvsHWZWRlQK3NELC6WnTZZ3Mhh8Y+VfU3FHCCOFNX+R1f5w+TJmu44QRnKfyuAGNou
	vooO0Az3A9/B1H/rxPKsTQ2ACgLY6wlajzqNDXef4GR6vDXHL40bWtakpTtcIx9Z9fGPtiuBWjW
	/lltsl2lP5IqTJ3R1tDbpVvffhaOPfu/plR7fL2UVpate8ePdWJcnzg1SzJdVn7b5KSpNLvSPcs
	avM2s1jP7sXytv4AfwbWqfnTqg1RkXDURjQ4ot5y3pkmltuO4ibjqApxO28MzxuCxORFXK1novR
	exPVB4LuFLZ+yXKyo7wJ0ZvBDe9Aeme4AcSHUsIQTxR92WPMh/wvjRhKkqP90jIr+1nr2G3ufut
	HW/75Q2x5ZnLhmgyqzYrkLTQgTc/0bf0mFfdysv0lKsHpYUfkV4+SLrT5tEMuDTmLyMreMdfK+q
	SenT/8hbxuJ/z/vgXihGkWeM/4/JKFo80a9pdPg4phtIqZgZVdnXhMmuZnMJmOt+3L3sW65NNqE
	JHQlCFURzxXw3gaZiRoHFAOLlcWsZVMHRjCaB0eE/XdUre8oxuhe6Uoa1yqYT/j1BY6vyxQgttt
	JkOUZjgAQV+zstxgRuaTqILicD0BeZwlddjCcIQ==
X-Received: by 2002:a05:7301:f03:b0:373:64ef:5dfe with SMTP id 5a478bee46e88-37966096b9cmr10223982eec.8.1794824050090;
        Mon, 16 Nov 2026 02:14:10 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:35d0:694a:1071:9bae])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm35126665eec.28.2026.11.16.02.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:14:08 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sashiko-bot@kernel.org
Cc: mkp@kernel.org,
	michael.christie@oracle.com,
	target-devel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: target: iscsi: do not reject the command on a Data-Out overflow
Date: Mon, 16 Nov 2026 19:13:48 +0900
Message-ID: <20261116101348.1650677-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-214783@kernel.org>
References: <20261114161931.941441-1-yhlee@isslab.korea.ac.kr> <sashiko-outbox-214783@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks - the NULL dereference is real, but it is older than this patch and
does not depend on it.

iscsit_check_dataout_hdr() already answers a Data-Out whose
DataSegmentLength exceeds conn_ops->MaxXmitDataSegmentLength with
iscsit_add_reject() (iscsi_target.c:1573-1578), before it looks the ITT up at
:1580.  isert_handle_iscsi_dataout() calls that function, so one Data-Out PDU
after login reaches isert_put_reject() with a command the core allocated, and
isert_post_recv() faults on the NULL rx_desc at ib_isert.c:761.  I reproduced
it on unpatched mainline, 5 boots out of 5, with no SCSI command involved and
this patch not applied.

It dates from 4366b19ca5eb ("iser-target: Change the recv buffers posting
logic", v4.3), which gave isert_post_recv() a descriptor argument and made
isert_post_response() pass isert_cmd->rx_desc.

So I have left this patch as it is and fixed isert separately:

  https://lore.kernel.org/all/20261116101108.1650132-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
