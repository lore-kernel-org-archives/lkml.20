Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769135;
	b=o96lPbV/8F/q3RxoYD+ZpeIilqP/UOOBA2rN+ObGW09yET0/aqv2chG3hl2fvi5lG9DV
	 jX6XrFQZuRUre8bxLUmqODGcSKUhLI7n4dSDMIpTpBh1TXgL+dAD9F88icfQBUQY92gv5
	 +JQdhz9RGXYNLxCaUT16eA2ra/DA040YPF8I+Y4UisZSbL/lB5jo3R1qZ7c9dLPCtdovb
	 31sE3aA3rofLQV9hgr3p1QaeyekssNi/4wscjsA1KBm71iTh/9mtESZqnr4SFhlyMraIJ
	 5ooiigX6QoBKFh04Ys1kFSxPB42AKZ/w72vy12ADcBBMWZ3fNq5tW7mZYMJS1gE46pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Rfx8/QKieNzWuOWEnTbfc0MHqfPFCPFKkwmu9s+LsEQ=;
	b=t7mM/uSSHcYxpRN3Fdw1dF2ZZmTCjciVp6zN68Ekxbnx+Wrg3MafKlRxQWVYu7eFFJR0
	 AwL8nmImPIRI5EKMVukaXhIEnFr7L/rLNgC/KahjjHCbErpdf8CsmTlCZc3q99wFBLkOR
	 j8g6dRxOHSKRRy/4fKwNKG/0vAafzTv2TMrcwimWEvOBMtz5noTjNaEfaMwL/TQufbOpR
	 Ftm4R3GsKqwQQdzxxr0RUqON03OKmItf4dwVf2218UIe787fNUXEVKzMZ+2CIgd4r9xKY
	 Xts4Bl8k7mYq3LLJ+SCZYcZSMHYu5XBgmY39N0PO5F6stBxaWszrNeYgeQIRRKkrL1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEK1UAhv;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A662F606A8A8
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A662F606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nEK1UAhv
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3ada81853so2377208c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794769134; x=1795373934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rfx8/QKieNzWuOWEnTbfc0MHqfPFCPFKkwmu9s+LsEQ=;
        b=nEK1UAhvCMl01hvbouw9seyvdetcS4NCdpZI7UFQbJEL+LLeSBaHvb8KFWmRuCJfkV
         wVeZ4YSQsMIrpa+2X6DKlbJlgoTg3Y+K9dp6SFjRqFqKQ0fJb9nBqkZQ8su92THTj4gb
         sufwRzJwLHbceHUY3kSDb2c8k3MlubNfhEY5THsXsLbPNpl3rWaYcg8YosgRXgtxSVGo
         erSbOkTzlNfFR15748TrHeq1xlUzyuCnJ3xAObNHKEfVJlV86zk1lKT3ujHErpmuxIY0
         Cji2rpsQBLEULthGikGy+PXFm1Vc/7xa/aTxhP2SDpxFeL+ywg+3dAF0A8YOPmA1/ydd
         zfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794769134; x=1795373934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rfx8/QKieNzWuOWEnTbfc0MHqfPFCPFKkwmu9s+LsEQ=;
        b=WbEj6/6yOXrnj3m7ITkVmawf4j1HksfgsoRbpxq0BD/5x/NoCx8K3uSk/GYJr3gtvt
         xGL7vnFX2S1wooPvG0qPBnUa3H5G1dTsxT8f2Oqe8GMfBVYHfIz6Ct/yRRulx9ndXTNN
         5/i/IkttdeE0FYvYWMOT/pvor8Q94OMt2KhHND2QdMgdJOxlZF5w70noebgF96AQnKet
         1Im8ldJNDFlqZSJaUXRsXMpcxEju+TRN/G0Bxn/WAv5i/XSVedfDiAmlsspuq9aFyHr1
         /7Tq5+rAYqRKD/pAZ8c8wrE38b29BpIL+SMwA/ysgE3UtWkDWANAzjHoYu+mKhXRy226
         dAaA==
X-Forwarded-Encrypted: i=1; AL+hErG7sBzS05TUojpAwsv5rC93CwUsdfuFiXoEB9uJBZ7tH2BtzY0hwsJzzMAlMHeLNyGSrrRM3vEH/qckLhk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y64MwWfe2aJxjD3K5sTVLzMVttTbxpCKgGjrfPLlAUixVXvTG
	aOO9B8pW6DEuw9HDsOnV5Xzx3jfrbtaKzCSI7MavOkbviSbzOVGLex01
X-Gm-Gg: AYBFou2yWufnDf7feOzNqN7Xgaykl4Au3XrcW2OXqKZY8WwXvMFLR66Spq/SMJ+zlqP
	SVR77dTkv3Nvhd8fKksm3ObdBaG1FBub78FhXi9z9nhlefrRZggJpQpla6z3uojoH+s2TxtiiO3
	WZbRVRR/MV7SLHl9mLzEVHQsw6rq6fk8KvAYvi4kccGBe5fAtXrFtrYl/j1ZL0G+YjiRDJm/NH8
	7l8/XcIbhu6pNtCJTpppb6FwxAVmb39l9akWn0AtcNz7siRxP/zx9S6PrEsQ9bDuTz4o0nsBPsy
	x3VXmphyFd42KUnAthn7JRjfCA2qmIZ504vGSY5JOMAqwXYYerHpf41ghkobDeM5RstfXYxBiOb
	Y+3VBmynXnRr3ckM0q97HgZQebocDReJdEusKzp5mYVqnvqEHHs9Py0qVs4GONK8VdPuI3ZTX0J
	ElxjvWlHy7x3C6zlKgP7cZPhZqQ24jgO3FhP9kFsg6ygtA1WHIiCAT4j6huqsIphMqn9lQoIfMV
	mX/mobrK9uvHgiToYcuQs0FCFSF53nXKFzs2XuLqYF0hN9yijkD+AovGBLMDGm4XgP4sTBPRi2g
	UHSkHlJA7SJ4kLnQk4piSuysVfh4AuwbfJIn9KRZxUxkCZMkE85yrN7in+9tS8HfMBgnfvX2Hi8
	=
X-Received: by 2002:a05:7022:8f:b0:191:444:425 with SMTP id a92af1059eb24-1b50306832fmr7755064c88.2.1794769133806;
        Sun, 15 Nov 2026 10:58:53 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5329ec87bsm82306c88.0.2026.11.15.10.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:58:53 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless 2/2] wifi: brcmfmac: fwsignal: bound the MACDESC_ADD interface index
Date: Mon, 16 Nov 2026 02:58:43 +0800
Message-Id: <20261115185843.64633-3-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261115185843.64633-1-maoyixie.tju@gmail.com>
References: <20261115185843.64633-1-maoyixie.tju@gmail.com>
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

brcmf_fws_macdesc_indicate() stores the interface index of a
MACDESC_ADD signal without a check. brcmf_fws_macdesc_closed() later
uses it as an index.

	if_entry = &fws->desc.iface[entry->interface_id];

A device that reports an index of BRCMF_MAX_IFS or more makes this read
past iface[]. On USB this parser runs with the default module
parameters. Reject such a signal as
brcmf_fws_interface_state_indicate() does, and count it as a failed
update.

This was found with a static analysis tool that we develop. A userspace
harness that compiles the fwsignal.c functions unchanged shows the
out-of-bounds index under UBSAN before this patch, but not after it. No
hardware was available for testing.

Fixes: b75c1a301b7d ("brcmfmac: destination mac closed when interface is closed")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
index e81105154d6543..56eb2c2943dbe8 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
@@ -1010,7 +1010,7 @@ int brcmf_fws_macdesc_indicate(struct brcmf_fws_info *fws, u8 type, u8 *data)
 
 	existing = brcmf_fws_macdesc_lookup(fws, addr);
 	if (IS_ERR(existing)) {
-		if (!entry->occupied) {
+		if (!entry->occupied && ifidx < BRCMF_MAX_IFS) {
 			brcmf_fws_lock(fws);
 			entry->mac_handle = mac_handle;
 			brcmf_fws_macdesc_init(entry, addr, ifidx);
-- 
2.34.1

