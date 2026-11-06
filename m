Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990910;
	b=Jed+EgfA+DHZrKlKcfV7l3AQ25vEeFDI/N1r3F09tsKeQveOVRzF4YT0o/xgt6K/HDoJ
	 ec83+jvLIwRVZ3+0Nk/JreBegmTfyMzHhbmvNS2WEFbCMbpJ5qAJ2MRGuBXSYu6eLPpMQ
	 BhfDV4Y8uNtMJa3AlFDMdHACmSS+NPBE38c3vFIaU1UI7yy+dOM95oK8hygM+w8Kr0VYH
	 AIrhzAJTtzIoqrBG30JZ+3OqR9fLGACNlfqBJ8eFOwIjn/vVpdHJA4hKp+5ZyDWuvVLxf
	 gVHVub2otGnyyTDuM5xek2MnA0d9OzqevlF5QaD6h8ZCXokhp+jDNL74izu1EO4ROjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DVgDWv3VD/ui3HBKkgpjgxEmwBxnrXvFZzEKOZanqwY=;
	b=nlxXicgNmAmjDu43Q4aZfTe5jw3bDIDx4Y4WUkoJ9BhPpeudh/Tugi3I1Yy3FYrzhyDa
	 6PWgdKWueESNQ9OeL6FtCpeABoOC/81qRpbWiQjkwdpaSOsIF7+X6tSk8CCcg7n5rCsiu
	 EYSQosp8qDTTVloawK6xJcT6uxeYxSfUtB+/ER1r6TZTaxusolB+UfsvmNz/ypFc+WBkX
	 n65/mQhPi/GPs46+NkGdaZyRhST1Vio5S8hRGNOVrFtpusMsHAZmQknGdUlnYaqehWpOO
	 cNljYYrdr3xtOwZTZycB6EKaOei01050I0eo9DwkCYtBAlEKeRSsOl7dYD3VRMrI69g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FRc+cgD0;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB63E606A33A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB63E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FRc+cgD0
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb628232d2so486834a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990909; x=1794595709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DVgDWv3VD/ui3HBKkgpjgxEmwBxnrXvFZzEKOZanqwY=;
        b=FRc+cgD0sIAfcmtcLNakdeROnktdrMH3HQMBnntP+qo9DD0PAz0Be1jkr+iEsVxs0J
         L9DAwLOWMkQKNeN4o0Ut6mLDZZwg3KiK6lHh51yBdMKq/Ctw/E+RsisQBLlwJUfzpjEd
         aU/0665XmvbKlhTRU2PUfpDtrGoEPz6MfuGRQ+830BUcnL+trlHt+tC//pCNkwlLvca6
         DxfseBjzDn9pcOh6Oodn3983my35PkNL71JQsbP/dPzZNU4FeG5KikE/2qgOxXBWs8c7
         nIDAKZiiEh6nPA5Pw8BMBqqmRzoOaPLKvdgLlmy/SybaK0JQC6hniYM3HJBiZ7AEeajs
         KNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990909; x=1794595709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DVgDWv3VD/ui3HBKkgpjgxEmwBxnrXvFZzEKOZanqwY=;
        b=PWTt8Bed3qp+e/bHlIlU/eeA9lI8DVYNGwlfKPC4yQashEeVho/EVj4DC8NGjyNvyG
         EMbbC8Sis8iULTXPSTEKsqMRQSkGo0RKlrax2T8ec3UmE85AlVoerkKFb6xMlaA3uiux
         gzIANSlaPYfaWqWqgyPguCOdFnG74oPBSDsUrSdBIbrkDlhZYSQ4DzfhSm8N/eoI/L5F
         oyEyo21iYl3YEjBEscXsp5e7P1E6ChNehix0aXDVQntaUbaJd1mCJm6kwV81PDSiwcud
         snAcMJj/bTgEpqMQkDtPh+QhBnPELjdlncVfYGiSqvh5ByUohsyPpxszBj21B6gu/YM7
         25Dw==
X-Forwarded-Encrypted: i=1; AL+hErHD6DRRp5SN7p9BRizUfzldWIN+8aHQ7sdt7qsCAlxKWcGzV5uqq1jvvvwNJlp4wwr2F2eAQvxPd5k5ICI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Aar5RS/stwcmRiYpxXwf+ziL15mMZiSxVUVRd/5gDUDQmBRh8
	RX7f4pYXw+R7v/EaU+HFuvZsjZjZYKljrd9wuGpwrKG7+jeZCyaCW3N/
X-Gm-Gg: AYBFou0+oiAeLbU4Jc9QWy7fVS/MILNDjxTaLAzXPipAWvvcIOOZdMbOJeP47ITgads
	rZkd8wzOjN1Z09f/tXi1feUsT/Whlf4u/BUCnlwQ48VFYtAXgf68//5ZSH7uRFv45wTPsWyfgIz
	BVIA425mXwZfpbltr846Jxp3i5xluMSF/OVz3DypiYYX2EpeG7pBWgQQt5yIEmgPRT0vzIkSiJC
	QxbjGIzTrwbUtRtr7mEfWlReC8xVEsmmaHDFH1vaeuF16NKVGCNcThomz6hDCzTM6WR5Xxx3GCZ
	hsUfMqakEBCod1Emc6gJD/Ex88PYIlfknw6F76qJyxJpOlSKomv/5Fs4p+d/5xiS2MN/0fbOM7X
	Vw1SMcLp/bWGPDG9l6S4WxofIoIqyf1WTmMRwKvWQI1m0PqLAfmgJ501zhRfbhyWMp3M0h/H5no
	w55mXEuc+hTVlFi/wopJbCnUQNkJYiSIMHH/7RGUtwEmDDMfu3Y1terDE2mct43G23KFvn1+bTn
	1SNaIV5xTLzWsfy6W7E5/h5CjB1p9UzUfK48ER/jH8k26DnbLm73Pfuq5qsV7+57Aab6QY7RkRi
	K95mu2kcTyc6TJ6hoCXmfol6ZHlbUHyvQZRlGBHypRQUjBlMnNvkX1svnnzo5wNA4j4pFYK12Mw
	=
X-Received: by 2002:a17:90b:268a:b0:3ac:a204:aa27 with SMTP id 98e67ed59e1d1-3b0db70e107mr3411850a91.66.1793990908850;
        Fri, 06 Nov 2026 10:48:28 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm45036a91.0.2026.11.06.10.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:48:28 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/2] net: dsa: motorcomm: Add devlink info and resources
Date: Sat,  7 Nov 2026 02:48:06 +0800
Message-ID: <20261106184811.350700-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add basic devlink support: expose the ASIC id through .devlink_info_get,
and register devlink resources for the hardware blocks, reporting ACL,
FDB (with unicast/mcast/static occupancy) and meter usage.

David Yang (2):
  net: dsa: motorcomm: Report error when FDB fails to add
  net: dsa: motorcomm: Add devlink info and resources

 drivers/net/dsa/motorcomm/Makefile  |   1 +
 drivers/net/dsa/motorcomm/chip.c    |  45 +++++-
 drivers/net/dsa/motorcomm/chip.h    |   3 +
 drivers/net/dsa/motorcomm/devlink.c | 208 ++++++++++++++++++++++++++++
 drivers/net/dsa/motorcomm/devlink.h |  16 +++
 5 files changed, 266 insertions(+), 7 deletions(-)
 create mode 100644 drivers/net/dsa/motorcomm/devlink.c
 create mode 100644 drivers/net/dsa/motorcomm/devlink.h

-- 
2.53.0

