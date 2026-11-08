Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794142204;
	b=tnLLzneuqE7PbVCfWvvSi87hscZVb32hd6Qt/kG6YT3thf7ANxPI4UwOal2XPut/VYYB
	 dqQoqGm8AA2qo28bxSZAxShUIW3eTYGkQIxWKezM2DHsfk4emYd2vFGgSWkNNG/ho20j0
	 t4sK4EgwhN2gJf8v4MjKvrsW1yzszOKkbiO90ezBcD+fX3yJbcQ4hDXfbymYL1n/hLBFP
	 CoNLXVyCjujvSHT2sQaQgzxye8NvK6fGoj5fG0ozzrr4EJ77uHHNe4HGZfBNoOesbs+uN
	 WKn1bT67YRh9UqdneB3Z3SiSod+Al2zz5wBSOfx1N0jtzIyihbiQJDIWMa+ClFIOqwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794142204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oJfGnvR++7Vf1CBC+n/pTwXWA1qSah/VZzevfV91S/I=;
	b=WQUS1RWAGAYOi25MC+5t14A1HYiakwPRDPdG8plEuslcubNSPMzQ1q699vjsVg0ZRlKR
	 K61oc17lPDLXKSXkDCX95eCHyVLYMFqvo0wGoa/Sk+B/QYOjV8ZzTKdumUNlI6FuvO/yr
	 hTYHNiQBoOj7Fo3diQXwAgvhNAKaWvMbguE/pEDZYTkOL0qOH7gGH5YTsLFBz9sv6n1+O
	 JtyM1IwiqlPTmuPaNtrAWahZrrxmutsKnoPvSjho9pAnk+X8ga5G9lu/D4O9Ks+jJ90m+
	 yLRdQl+ghCiCY6sPp9tMivKPnLs6kTmF69SkNbGRf8zfSige9MppASX0dC6gVqI3A+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vietNS6N;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE6D606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 12:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAE6D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vietNS6N
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36f8cdd30beso184439eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 04:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794142203; x=1794747003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oJfGnvR++7Vf1CBC+n/pTwXWA1qSah/VZzevfV91S/I=;
        b=vietNS6N5zCsXv6MLfVJkKW9Da18RJa+gqmlpEKL3gTzyuenpPTs8Flg+8jYPloUwr
         QKxqjzIvVYnGgRI0CEJdbogCArqwHSilB7AI/kAl6NlhcH+EtjTFdw2W2RywsB3rh40s
         Bnn//LrSSnqlq+58nWsayWK/ofII7wwbdWPbF2T/1lwWnm2yEKEb6A03pJif/gb2G7h7
         DI3eXF6KBpW0zQZqamjz5TAFCZNLJuEzPod3UXSoM2fUxjOLQB5aOqShpV0KTbAhV2fS
         LiU6SwIA+bYlmAvJ9M/ux2wVmaq4rakvWSI1oDiW60uPtRgbeCvWjg75E9BbrUE6JGeO
         iahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794142203; x=1794747003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oJfGnvR++7Vf1CBC+n/pTwXWA1qSah/VZzevfV91S/I=;
        b=1mkFfiEgF8gaanLjGuZCaUSsDMn4unHS6gACkCaIIkxe13zG7hx5fjTByoVL5w3m3N
         c2qecCVbxYbnELI2d8jJel3ICm6eqjubsIdNMWdRJrF+m7DB4RCwaS0xZc/nzwn+ERnw
         LpD7SJJidAerHraewTPCXD8p6F/qgZh/AJWzbalVVDR2or1nrY0rVkX4aoMgbD/31iOt
         mRrDvZsYq8eOlyvSCsuL1M7QmxgNmG1vcYB6GpaBxdFsE/CMwwpceGf/Y9hF0zjiqppb
         FnPICE2ac0Y3nL8/fUTtbWIN+IzRtEeUSw3pFSUO58b+oIhYyUUp3sFYKRbGaniApCRr
         gNpQ==
X-Forwarded-Encrypted: i=1; AL+hErEnbPz5BLA5qy9p5OjzsW6XE0P3SWxSTqJXb0Bwz4ApnSyJB1lLOXaKYLFZ3QIOV3pSlw+77wgwVryszjk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AXT3h7R5gZ8sD9OisrRqp/VrSNqXX10rjI95xNaH3hk9DiCOb
	0TITHCmre2+RkmQQfPchobWFQSZsYgdFg8Op2JoapEZZjR74A+4EC+IAZUiS6etX
X-Gm-Gg: AYBFou367t5natv6sHA4Nk+W3h93P0t1Q2U0Ue+zmJgKK0pKNkMrVIrVZJxnKOxGJvj
	n4QE77brk+kxRVE3eHQGosQXEuXRzu8wfHe94WA/eqwNM0c+cFeICl29/Zn3TQOihODhHMgqTJV
	FSo2IsIklp4TMBBPRlaHz8Xbc0Dbc+XgFrfeF8U07NWDcG1fKdu+wrM9X3S73CNkfw2P8qfqlbH
	1Ee7rpl3dn303emniEdGljNLFdI+aezNFTzfyiODy4YBAXc9z/SEzV0z6iM7UE2oWLwtgGgpTJC
	PK14m+1HgjJRrth4Gd7LRBrhtGRX7e7HP8ocupuKL4FBk1FPtFO0lOiOfqT9Vi9oFG9HcvdaPQH
	tkdS2QbRtzfZ02IwJ8EFei8/Bg8DRdOgvcU+2u+fciJyGX/NPPIm89oJxGUJoCcqlar9CRii7Xg
	BeAeKFZ/PPrmuWd3bfwUDs+APTuZzpv0x9dzC2D72Z4PcywQWSopivtOKWFmlFWQx+6AN5u5iMw
	ycL7/Xg8lHCQx++eVklT+nCTDY3aUNf4rnevqnIFZtP5P6GcA2X3SuYnR4rso+xE617JXyd7TOg
	3NhxiV9xHQSOgfY+xD5pTQwFd88ZLR9rXavptBCg5HpCv7am6iZiastwrfLuz8DUdWoK7jYJULr
	LWnWexGOXYgqeKSv8x7Xn1/14s8wHkprjntIYGxKQ
X-Received: by 2002:a05:693c:8347:b0:36a:1d6a:596b with SMTP id 5a478bee46e88-3725e91fa89mr3067487eec.29.1794142202678;
        Sun, 08 Nov 2026 04:50:02 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265619774sm5623975eec.8.2026.11.08.04.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:50:02 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Alyandra Zahran Nadhir <alyandra5b@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 4/4] ALSA: seq: ump: Fix RPN/NRPN state handling at MIDI 1.0 CC conversion
Date: Sun,  8 Nov 2026 21:47:51 +0900
Message-ID: <81e86fb562df29953314f754b1daace962e85566.1794141913.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794141913.git.sammiee5311@gmail.com>
References: <cover.1794141913.git.sammiee5311@gmail.com>
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

The sequencer converts MIDI 1.0 CC and CONTROL14 events to MIDI 2.0 UMP
with the same RPN/NRPN state handling as the UMP core helper. It has
the same problems:

- Data Entry without a selection is sent at the next RPN/NRPN
  selection, with the number only half updated.
- A repeated Data Entry for the same RPN is not sent right away and
  ends up as above.
- A Null NRPN is not handled.

Apply the same fix as for the UMP core helper to both the CC and the
CONTROL14 paths.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Fixes: a4ff92ff0bdd ("ALSA: seq: ump: Transmit RPN/NRPN message at each MSB/LSB data reception")
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/all/20261104121508.3972314-1-sammiee5311@gmail.com/
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/core/seq/seq_ump_convert.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index bac37d4ef43c..62bdef6dca58 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -790,13 +790,22 @@ static int paf_ev_to_ump_midi2(const struct snd_seq_event *event,
 	return 1;
 }
 
+static void reset_rpn_data(struct ump_cvt_to_ump_bank *cc)
+{
+	cc->cc_data_msb = cc->cc_data_lsb = 0;
+	cc->cc_data_msb_set = cc->cc_data_lsb_set = 0;
+}
+
+/*
+ * Deselect on a Null RPN/NRPN, but keep the 7f/7f numbers as a MIDI 1.0
+ * receiver does. Otherwise, when the LSB was already 127, the second
+ * message of a Null would select RPN or NRPN 0/127.
+ */
 static void reset_rpn(struct ump_cvt_to_ump_bank *cc)
 {
 	cc->rpn_set = 0;
 	cc->nrpn_set = 0;
-	cc->cc_rpn_msb = cc->cc_rpn_lsb = 0;
-	cc->cc_data_msb = cc->cc_data_lsb = 0;
-	cc->cc_data_msb_set = cc->cc_data_lsb_set = 0;
+	reset_rpn_data(cc);
 }
 
 /* set up the MIDI2 RPN/NRPN packet data from the parsed info */
@@ -820,6 +829,8 @@ static int fill_rpn(struct ump_cvt_to_ump_bank *cc,
 		data->rpn.bank = cc->cc_nrpn_msb;
 		data->rpn.index = cc->cc_nrpn_lsb;
 	} else {
+		/* no RPN/NRPN selected (e.g. after a Null), drop the data */
+		reset_rpn_data(cc);
 		return 0; // skip
 	}
 
@@ -827,7 +838,8 @@ static int fill_rpn(struct ump_cvt_to_ump_bank *cc,
 					     cc->cc_data_lsb);
 	data->rpn.channel = channel;
 
-	reset_rpn(cc);
+	/* keep the RPN/NRPN selection for a following Data Entry */
+	reset_rpn_data(cc);
 	return 1;
 }
 
@@ -866,12 +878,16 @@ static int cc_ev_to_ump_midi2(const struct snd_seq_event *event,
 		cc->rpn_set = 0;
 		cc->nrpn_set = 1;
 		cc->cc_nrpn_msb = val;
+		if (cc->cc_nrpn_msb == 0x7f && cc->cc_nrpn_lsb == 0x7f)
+			reset_rpn(cc);
 		break;
 	case UMP_CC_NRPN_LSB:
 		ret = fill_rpn(cc, data, channel, true);
 		cc->rpn_set = 0;
 		cc->nrpn_set = 1;
 		cc->cc_nrpn_lsb = val;
+		if (cc->cc_nrpn_msb == 0x7f && cc->cc_nrpn_lsb == 0x7f)
+			reset_rpn(cc);
 		break;
 	case UMP_CC_DATA:
 		cc->cc_data_msb_set = 1;
@@ -993,6 +1009,8 @@ static int ctrl14_ev_to_ump_midi2(const struct snd_seq_event *event,
 		cc->cc_nrpn_msb = msb;
 		cc->nrpn_set = 1;
 		cc->cc_nrpn_lsb = lsb;
+		if (cc->cc_nrpn_msb == 0x7f && cc->cc_nrpn_lsb == 0x7f)
+			reset_rpn(cc);
 		return ret;
 	case UMP_CC_DATA:
 	case UMP_CC_DATA_LSB:
-- 
2.43.0

