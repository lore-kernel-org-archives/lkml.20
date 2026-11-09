Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202492;
	b=MQ3UZA1qW1NN7946teGQTl09GptTDW0caQVY3DBLPAeCIsha89HwR68Zy+mtdUi12zpS
	 zQZBqbqNjIyYV7OS8f9jsT+Q34RoDC4QxZkXE7P7vgZha1ELDt9KmHvh0ECJtm5syo1b0
	 es34OVf8wrKbInzL/CQY1/6qxKNStUGmlBOLYt/slunh3txGNcV6MRHC3GL3itzE83l2q
	 02EHty40vOGuwHg2fqkUeHD7IC8Q/ENkSbOHaBTZZOMVTvhLSsOpxWNwJ2OUsdgsOJB+y
	 DGprMEdafTSTCSvLuW8JYM5OhBHmEVqsPWd5+K2PwjsYEEUfEsp5MBzYKjXWnF7aXyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9QM3E9R5h7QQhJE/VBUjkl+y1gXEpwwAkby8JdqwMUQ=;
	b=coJi+zE3sZ6pWKB2dknCCohMP/LY3NCoiC8RpWZ7F4Wrv7OwWixVS3JIE1knMbSni78X
	 sCDADi/2f1ialdM7mWaBn4SMDr6aFxxFD0CYjpmoHq1KM65tDpOgji0ZtfnfYtKGDP1qF
	 UfEhG89Gnla0lZAVlAwXJ9/hj72gd7z2uWTuUQEqnRZSLp1UDxg7Iv5qqRzh+4wQorGZC
	 Xignz/R5hhZzc2zQlswcfUflMo1PYnFRpFEq/sWCSlbPpe+YQ6oJbzCp/3FO+xd+8dKEZ
	 3zAHbTT11Aq83ZGSvtmeHfTsW94RxZGr4GO+7HluK+tutU7wi1LMJwYNBNvv9PJtnGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0Ht0KGy;
	arc=none smtp.remote-ip=74.125.224.133
Received: from mail-yx2-f5.google.com (mail-yx2-f5.google.com [74.125.224.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45F9606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B45F9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0Ht0KGy
Received: by mail-yx2-f5.google.com with SMTP id 00721157ae682-8b358816038so2116087b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794202491; x=1794807291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9QM3E9R5h7QQhJE/VBUjkl+y1gXEpwwAkby8JdqwMUQ=;
        b=R0Ht0KGywlqdHOHp7SpQJR3NubGm/jPBw7A7DRxSaKUoN4XEmr8szx/IYpgF+1gUYu
         NouDl59PhZuEzCzO1M8GuIsB+QxEGLSxyBj/9efVMUPt3i4p1VCBafHz9azb/ljQ5tk9
         kfJXXnXCkqLvmRUZ3Ylev0WMcTLW8tgijdG4Lcfrp3L37bmtgjCA/61EmMjcTLdGfGxD
         Qd85fEzKulXf35TOqt9ZGMUuKPhis0FtO+z33hcICMRPaQs0ek5GUE42lQFCLNJb6d7m
         Hk/Rr/n9xW9VRk34VpUXgUZFtr7eR0gs5TyXw5CcXVV088p7Cl0zlDHASUmDZSolAb0i
         x4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202491; x=1794807291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9QM3E9R5h7QQhJE/VBUjkl+y1gXEpwwAkby8JdqwMUQ=;
        b=w/CJsg7G5V1SLutDWaC03a5eZgI6GF+UuJI8W9a/6JSvFnnZRenSs6n2ck9Cw7I89u
         n8TLNlKxe0kESv7exzYP2UKn7SyxsWkfKWkVKdxxUCAlh96T+guFtvcEkLPASr+RC+dk
         7P1NQ8z0WhW4Hqv5XzAKKDAwbbUes7QDsZUUQFZ3HUj5I+FZVAoFtdkzUgzWB/8FC7c8
         Osyo8qa3Rv5itvU6E7bvgghK1OjWLYE6YYzN2sw77FaDiLeSBOrHxoyKnMW/ngp4cfro
         aVJ8LxxZWnCWTJe+Yo/phDPZv3S98T2q0jF6jjFpy8WcXBO/ZvGAgkO9Ha7YLf+5zptF
         jNUg==
X-Gm-Message-State: APuU4Z/RIJLWJT3Btx2KF+wlAelTgvmw7YOSg7qR9EVW4tMXwGWic01v
	2ifwM15PpdVDFZg4TKL5yDmj3VPLUn2RfibKg31vnXamGdpbVNV7vbLQHw9dg5u+
X-Gm-Gg: AYBFou1VtDd3zL0hugGJ5w4bibe3CHCdDtLABX/j8J311ZkFBp8ydsVj4PBDX7TdCrL
	QVR4PPuFCJyiEa34fQ4Fokz0jTJ20AdK3CPKgaTLrkl2M5JDphM+XKH3R3arLAJM/ELCG8IDFB2
	cSzv4++gpgERTPwq2q+hzo4IzQ74KgmUdmGpY0GNrfMnW8fXI6wovbLXwmsO6YhWlD+qqQm5kV3
	XJOdnceJs4DOzdZ+RGNa5rRGWCKXPgTg+rt/VoRZzIUBaf7fzLMLBfOpp+Bl+gikMWLUQEmHdxA
	3AImQjJQNstfqCS4eYKmzso5Gam4FPk4psV49L/bPd/AKXaQMDh0ifH3qLpzgxP0Q4RJmT/n4L8
	UPhoIxOFSLr9oG3ev2QVCbIfdfXLVBngdRJO90BKPilRyTh0NPGLUFgqdG4IucM61HlPQHKpQ7f
	1/cIakDJNXJ25NTDR9SuRDxPvy8QIP8DPx/GTJX8+YemJt3BAyOhEZWUPhTei3C5korigfexSG1
	N1LKTR10L83G/onmZYDIfRak43y72tm3y1NcaPBl5+tKVQ5pp/aH/FjWRG2Ae8WiMRanKpR2FmA
	9NFj+agMRanf8jhHUXIRrrdclB+V8im0hYyehfzqdqNQYrhJyEY/CVMoW+5twg+j3btoq7wA8S9
	hEwnXRQ==
X-Received: by 2002:a05:690c:88:b0:8b2:edac:7a4c with SMTP id 00721157ae682-8b36c9dc63amr14716347b3.10.1794202490693;
        Sun, 08 Nov 2026 21:34:50 -0800 (PST)
Received: from Xinshengs-MBP.attlocal.net ([2600:1702:7d20:7d20:f9f3:ca9:791a:3a8d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36be923e1sm27906237b3.41.2026.11.08.21.34.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:34:50 -0800 (PST)
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	nkapron@google.com,
	gregkh@linuxfoundation.org,
	khtsai@google.com
Subject: [PATCH usb-next] usb: gadget: f_ncm: prevent double-free of OS descriptor table
Date: Mon,  9 Nov 2026 00:34:40 -0500
Message-ID: <20261109053440.49156-1-xinsheng.zhu.ny@gmail.com>
X-Mailer: git-send-email 2.54.0
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

ncm_bind() allocates an OS descriptor table only when
cdev->use_os_string is enabled. However, ncm_unbind() frees the
table and resets f->os_desc_n without clearing f->os_desc_table,
leaving a dangling pointer.

When a ConfigFS gadget is unbound, the function object can be reused
for a subsequent bind. The OS descriptor support can be toggled
through the ConfigFS os_desc/use attribute, which determines
cdev->use_os_string on the next bind. If this flag changes from true
to false between binds, ncm_bind() skips the allocation and leaves
f->os_desc_table pointing to the previously freed memory.

A subsequent unbind may therefore free the stale pointer again,
resulting in a double-free.

Set f->os_desc_table to NULL after freeing it to prevent the stale
pointer from being reused across bind/unbind cycles.

Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
---
 drivers/usb/gadget/function/f_ncm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 500c9c19c78b..685152ec9a5d 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1741,6 +1741,7 @@ static void ncm_unbind(struct usb_configuration *c, struct usb_function *f)
 	hrtimer_cancel(&ncm->task_timer);
 
 	kfree(f->os_desc_table);
+	f->os_desc_table = NULL;
 	f->os_desc_n = 0;
 
 	ncm_string_defs[0].id = 0;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0 (Apple Git-157)

