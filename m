Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793315902;
	b=fd40ppYl4yN5S0eMmbnwTrCWJlFeThSZqJgCBFx+aKYOU8pbm6m1dyfV+mQXT/hMlt5r
	 fG+51p1uikDNh4ybnOlWVdT7Lh2X/PVmE6Qi4m1rNT3fZBjqRXKfI57AdOLk7/Nb9OezY
	 3bzomp3BT+FWSnJ5LqAICIdOU93FH7zPpaxjGMmAhh0sXl8dPiu5z5DJ8cPjIIGIVxBKP
	 +EyG0ZuefXYOvlPduxW9LLKxx/G5eVZfSUtx1C+jwX85La0ezHaXiCDLsJM58Q/S/TbwB
	 b3ZaqKV1os4XCzNmK0uY6kX17/KKj29kIXe6nJBiRzK+zKQ5awFKtkjZIfpJb/IP3VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793315902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=QztNW8xCZa3I237qi38L8jVCSovnxhoFmR6AqIN/+uE=;
	b=EUnuzZtlJlpQs1YhUGK/pArpsyHTnc1yA/vqQ7Dbv6sWnNnW45EOBIpS6X4uWZ6yrBKY
	 sCgIPYYO99s3SjSutKrSbDCbrOIyHrJDqE85SbwB5vMs4wmSaA4h367F8rA0cMA6+4WTh
	 eM3WuOPUJFuWK/d+cBiGD6ch3/0qTsQYFtaemg1hYs7udMEcv8EELVfSWUJkDwvANmk05
	 HwqY6eYaF9rIsODv/B1JNdF18UpoupZZ8g9ZSHPsq7FmK08xHUgRWwM/y/3GmR8sPncQI
	 M/s/ASr+WfK5732+UluVArdzS6E9vBFdwlDdbZKf5EMKY5W1EpK3AgQq6bitRBfotAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQfny9hg;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588AC606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 588AC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQfny9hg
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7c2f48f3a96so21628137.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315901; x=1793920701; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QztNW8xCZa3I237qi38L8jVCSovnxhoFmR6AqIN/+uE=;
        b=pQfny9hgOyIecqE7ON3oxvCMVGRRj6Ck9jcI8edPD9+mQZDHxwjCs7CWA3ldoi1VmV
         ZwYVZI3AOG4gulqAGuVu6rhdEZPQWqxY4ID14ggrhFJyveyoxlv+e6u3tR0KF1Owsimz
         i9ugaM61DCRuIMTYlAjJmkBKXd4KjVBVZmau7bRpYQBH0z2tOwGXKQ60V/ajkI4tMUqH
         opfdNwxd1IHhDqT3+dBg4GIvWsXX+LaatFS6B0Xc4SoVTFuFgS/trqICmwra2W4Vd97h
         JzwSF4gTGij/bVMU7VCOJf4VfX95nvOyNO3eHSs+Z4eB00w2CITP7Q8H1FT12T/D8S6G
         ZgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315901; x=1793920701;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QztNW8xCZa3I237qi38L8jVCSovnxhoFmR6AqIN/+uE=;
        b=NUN2RMEPIA6IamNEGOcs6pBXh2CcF0Cd8IoTRCoWQA2ovz6bwoz+ZkIJ74HBNDopT1
         YchhfoKWig7O2zfklg4gGtnr1mphDz+7YVzuxMdg3xw7THI5sspBkCJVrr35PEXt69+v
         ZbF4oFpM7S/d/c2RkNTLeHTE0lZVpiAHPkUDFiuzAGleiBmRpBPUzrSMd+ookO9R8SyO
         a3i0dsNppRFtB7NlLM9o3nhg0wJQi7tn2ytdHT7jvWjt1o9tgsWX5d1/uuryh/jvJ+1k
         MRmnag6OWcZNWPOcBZErEK+FqY1naLKib6HHgQJMo17/RRFXlpRm4/pMmLEvu4A1H1VT
         ThGA==
X-Forwarded-Encrypted: i=1; AKwUvByRf0fDPJ08fhOnNHfrDTZV0pL9LyWP4bJzW+YIAD1wiYzQ/Onl1oR2YtuViLFYaccYcdUyIVnShPxN4y0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFZVlOVA+uquv/mCiH/MNT/12lFE1U9CV9EYnaNaLPbDSdNX+M
	zOcW6VbSGLJIYpQ/y67kNHFdBu5M0VNjJSIa17cYdLiyUYQ+0QDKOmsn
X-Gm-Gg: AYBFou3aRrLXkf1IjUxnnpRS1I/NK7SEv+H4Yej1re9mr7Avu6uSyw/a8iphVBv0rD8
	T/siq1RrR540Zd4LOm5wFS0nntBRA6KHqK18526b45ungRPA0uPdK5i7Y+si0GMNk2XzCQF2N20
	Ya2fDhx9/sWhV4VCTgPJrp1HAikJaSlrXKAMo6XWQoi9nc/hXfA1DGVuVwepIf/ph+TDpPot7Kf
	PnC2uyDmv4gq2l/dT3XG1FFwZYIN/spxnV6BjIZb/bXpxtF7mK1ySnGwSfgIHjLYBSOeCabUN6z
	DoCVAiBYIEMYOErxvwu0vwqWf6PtfDSCYq9vR8tUguYF7GqHdu6hXS9kDLO9lCP1qtNm8UwO9B6
	xavESP+77dVnUl8wlYYwPZ/3BQVzoYCJ7nr7J0gWeTTl6BW8qTunYUUofcp60JYeVn0LkeqjDtF
	Aw1Y6DV6Zeu5sdUBMF8r0FXsQwAwIonMy8mT07ZRRtozfu7pquWqorSJtMjbt8XjnglYuvBK7KS
	s5j0CbacMMRVF8xn/PERFajajfxtqvwvzMMle0CTKMb39N2jD2llIkWi745ivG6getdUEUboRl7
	AlybliiNMV8IyRp79MNY8Kts3/i4OtQeKhiBWdroQYe2OI0R6u6BmwidTLBb7XK0zDlsyckzXwf
	KMGntCQ9BrqavLU3/QUQJaBLcOcYk85i+vg==
X-Received: by 2002:a05:6102:8099:b0:7c3:472d:be6b with SMTP id ada2fe7eead31-7d072d376admr338758137.33.1793315901228;
        Thu, 29 Oct 2026 16:18:21 -0700 (PDT)
Received: from [192.168.15.16] ([2804:1b3:a2c1:77a1:5cd:8fee:f3c:4da7])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee4e7453sm319509241.11.2026.10.29.16.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:18:20 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Zhenghang Xiao <kipreyyy@gmail.com>,
 Sanghyun Park <sanghyun.park.cnu@gmail.com>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 [PATCH net 5/5] nfc: st-nci: validate pipe ids in st_nci_hci_load_session()
Date: Thu, 29 Oct 2026 20:17:35 -0300
Message-ID: <179331585573.30322.9370333985353215726@gmail.com>
In-Reply-To: <179331585573.30322.4049957541187612575@gmail.com>
References: <179331585573.30322.4049957541187612575@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

st_nci_hci_load_session() gets the list of open pipes from the
controller and, for each pipe id in it, asks for the pipe information
and records it in ndev->hci_dev->pipes[].  The pipe id is a byte from
the controller and is used as an index into pipes[], which has
NCI_HCI_MAX_PIPES (128) entries, without any check.  For a pipe id of
128 or more that the controller reports as open on one of the known
gates, the gate id and the controller supplied host id are written past
the end of the array, into gate2pipe[].

The pipe information response is not length checked either, so a
short response is read past its end.

Skip pipe ids that do not fit in pipes[] and responses that are
shorter than struct st_nci_pipe_info.

This was pointed out as a pre-existing issue by the sashiko review of an
nfc_hci_create_pipe() fix.

Link: https://lore.kernel.org/all/178952042575.22033.9676833200303972344@kernel.org/
Fixes: 8ae01f796771 ("NFC: st21nfcb: Add support for secure element")
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
 drivers/nfc/st-nci/se.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/nfc/st-nci/se.c b/drivers/nfc/st-nci/se.c
index 607ec768e..909fb1493 100644
--- a/drivers/nfc/st-nci/se.c
+++ b/drivers/nfc/st-nci/se.c
@@ -191,6 +191,9 @@ int st_nci_hci_load_session(struct nci_dev *ndev)
 	/* Complete the existing gate_pipe table */
 	for (i = 0; i < skb_pipe_list->len; i++) {
 		pipe_info[2] = skb_pipe_list->data[i];
+		if (pipe_info[2] >= NCI_HCI_MAX_PIPES)
+			continue;
+
 		r = nci_hci_send_cmd(ndev, ST_NCI_DEVICE_MGNT_GATE,
 					ST_NCI_DM_GETINFO, pipe_info,
 					sizeof(pipe_info), &skb_pipe_info);
@@ -198,6 +201,11 @@ int st_nci_hci_load_session(struct nci_dev *ndev)
 		if (r)
 			continue;
 
+		if (skb_pipe_info->len < sizeof(*dm_pipe_info)) {
+			kfree_skb(skb_pipe_info);
+			continue;
+		}
+
 		/*
 		 * Match pipe ID and gate ID
 		 * Output format from ST21NFC_DM_GETINFO is:
-- 
2.43.0

