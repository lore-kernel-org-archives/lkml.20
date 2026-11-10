Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336252;
	b=oswJpgEZzgmJe5iWOt4l9R0t+XaAmlvMZ1rebNFpwkScGsT4ATFBOAb1Kn0Bvc/SDCpm
	 ZG7dgc2QI+gld21OhzFrHA64GrKrp4mMo22XJ73hzr8NNYl5zEafWhmqhtsGGuU7N0yvI
	 57pC9oUSqptGttAldVPm9pgm+MSmtq0fjggMaomWxSH8MLJVQPKiIoPKWtJQxpbXQJh9w
	 JeEuAHOr9syQeRMW1Ymlv+NOZ5vLqx8g67ZI/YYgHbq3qZp6D23jwXiHCGJM0tcotJzoW
	 5Z/9ZwmsAdNfti/VCmCQ3Nz5GDjoWJmGuBi6eHjHN3QuhWLRbvfr4Zfw0VRp9hHKPrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/MHAqmpZVDf3RuRGxKwN/uRcmtCFuVXbXAFmMCLLjBg=;
	b=H80flYGrNpFh/rZftRRM8q76EC0Xvcb9n5D28oLmWJCCtdmnbhVDTT1YRScBARXSw+7J
	 4ADI3nTdDnJPsrpaOJF4V2zJB339aKpczW9tA558nZ770KXI1LuWiku3ddGctYESzqAzc
	 /7zReAmMtlsk5wLICshoXPVgyAcUFqA2gSxNi5PIry4DG+rIyFH87ReUP28j+RZ3Djai3
	 02NI0PF46WC6xUTJ3UomnhR6Lga+GkHT17/rWt7N5DDSGwP0lmaKnskYi57QzBqbAOxnm
	 KpLmw6Aia4j/tjReyxjfiXoTNX3A69CpxcfA/ZfHbEBPgZ6cwEQ9yIzD0jzNpTYgn7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qf7j0Rpr;
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F1A606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43F1A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qf7j0Rpr
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4ad60ec5eaaso2001852fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336251; x=1794941051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/MHAqmpZVDf3RuRGxKwN/uRcmtCFuVXbXAFmMCLLjBg=;
        b=qf7j0Rprohyj67NfIPCudq7EmO4QjBIsOLiTyQwe9jBzpBIszrcjdygCpFZQecpGiW
         E/VPoS+58sjZTnaEPm4wNSASOQK9jpb/yIeZTFhDi0jEnAwhIlEdzBYNlMby1mKek4fi
         OY8iNRcoZC6HXemV21UtkYFi1fPood4ti+v6X51dK9XA4QYNgF5ngm/Ik2jGt27J+Yug
         S7cGWLJS3JODOE5iWggWDSHqtbFM1V+8CKA7+6nfyak7SZn0I78T9SYEFTi69zjYggRQ
         fjgzU77Hi6z2Y/uKIYL7OXNx1hJkh7uHdigOZI7RSK+2N69ekFFbWIK/HoPGbml/3YMV
         bw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336251; x=1794941051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MHAqmpZVDf3RuRGxKwN/uRcmtCFuVXbXAFmMCLLjBg=;
        b=yoaY91EfjcI2UxgqUnfefJi7Ijrko+47kFCmk7+gaatRcxn4pB9424mREzhpOt2/a/
         XZyS3ZA6qwZUYhng7ii8GPqb3+9eAPc+D/kxS8DfXJTm1qNm5UHafij9FHPZUsOwQOCF
         Nun9tKL0Vm7SH2dVn3/8W2XNJyjwfvUuiEdynivKrMrG66MnhD5jPmhJW4I/zYFiV1wl
         iftevP5J7hAF7eBHhLwSfEsw6BYL83G039uVz0pkFMhIzN3YxK7TY5alr6BaIr5BZwFY
         5wDVXJxMU0vSh8pVhnUytV5fNnEyIh/w9egI4sGaTC+Yi9E/hdiNC+USH3SHcqt/iSuc
         ocsQ==
X-Forwarded-Encrypted: i=1; AL+hErGL6IrwIWACJ4YodzCJRSgpHrVohg7wcFTVOAiqcs2gTXIOTaKrm8hAfCbggf3wj6rDMGZHp5hdyjKI65k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ulclgc1f9wzxPKwlw9syMMXwmR8XlhRNG1dVnqPduSQXMPRkD
	HBC5bwn1BryXTMpB2aBzVeKmJlydU+8JrsnwuI86Wc6izTE3oNO2dmOL
X-Gm-Gg: AYBFou06MMV4J+GzlhhSYeqMZxVKVkBXE91XSSA6lMP1i7flpkWk1Z76Qb0bEQ9ySnD
	1coXOOan/A9L6+/pPTsLT4Iq9l680irk+fXHY5amxLdJ765ZGeOZVxI1Z7zhYNq933TuH8XpgR0
	YPh/+YUnUGx8DYeKsKgFOFATCP7GG6RaxegvTf2N7vmEDwqhxXsPgdKKlJKmFZYfApXvZsJm98X
	7q5ZKJ921j7P3gg54hOuYDIA1/lXFjkKCc274eodrPq3kh3m6n1E2ow41DQu4QJ55PuSJIpKbEj
	nM2H24z5ZtiCMMPnThcp5WFG2qlDJnCB3KZ3cZgd5J5xxBqU9dNx1E0Fa4JlF+eEZ5p8R0VXz6i
	KvnpcZcEvGGg7uZ2DuETe5LZ+sxxQkkk1l3FVC58eUyDBF9EASqGWGvU8Rupcpzz0aNBO1lQPJB
	OY+OXkDgVcYn8OePtwOtvs4uMXJkGldIIuNuKiZZsGxVTqE1Ca8IaShYP/dH9cE7HqIrcUUB1Ke
	dToOEm+vX/1+RVbDTbKwk4xB9Ibvp2FvrOAdMs+dEKz+LyyhYromjXeNwo3gZQrjk+YXdIe9ph8
	N+Dz24FJrAkJlkXiDh8UBmLv4ywJBOpgGw==
X-Received: by 2002:a05:6820:f014:b0:719:1627:6c16 with SMTP id 006d021491bc7-71916277259mr109766eaf.12.1794336251088;
        Tue, 10 Nov 2026 10:44:11 -0800 (PST)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a8f660b2sm2225776eaf.4.2026.11.10.10.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:44:10 -0800 (PST)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH rtw-next 0/6] wifi: rtlwifi: replace the 802.11 header helper macros with kernel ones
Date: Tue, 10 Nov 2026 12:44:03 -0600
Message-ID: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
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

base.h and wifi.h carry a few helper macros that duplicate things the
kernel already provides. The reserved page builders in the fw.c files
write MAC addresses and the PS Poll AID into their frame templates at
hand counted byte offsets, there is a private alias for
msecs_to_jiffies(), a private rounding macro and a private frame type
test. Some more are defined but not used anywhere.

This series switches each of them over to the kernel equivalent and
then removes the macro.

Patch 1 uses struct ieee80211_pspoll for the PS Poll template. Its aid
member is __le16, so this one is more than a cleanup on big endian
hosts, where the old macro stored the AID in host byte order. On little
endian hosts the bytes written are the same as before.

Patch 2 uses struct ieee80211_hdr and ether_addr_copy() for the other
templates and removes CP_MACADDR() and the FRAME_OFFSET_* constants.

Patches 3 to 5 replace MSECS(), N_BYTE_ALIGMENT() and WLAN_FC_GET_TYPE()
with msecs_to_jiffies(), ALIGN() and ieee80211_is_ctl().

Patch 6 open codes the one use of byte() and removes it together with
two macros that have no users left.

Each patch builds cleanly with W=1 and sparse. I do not have any of
these chips, so this is compile tested only.

Rishik Yechuri (6):
  wifi: rtlwifi: use struct ieee80211_pspoll for the PS Poll reserved
    page
  wifi: rtlwifi: use struct ieee80211_hdr for the reserved page headers
  wifi: rtlwifi: call msecs_to_jiffies() directly
  wifi: rtlwifi: rtl8192se: use ALIGN() for the H2C command length
  wifi: rtlwifi: use ieee80211_is_ctl() instead of WLAN_FC_GET_TYPE()
  wifi: rtlwifi: remove byte(), packet_get_type() and
    FILL_OCTET_STRING()

 drivers/net/wireless/realtek/rtlwifi/base.c   |   2 +-
 drivers/net/wireless/realtek/rtlwifi/base.h   |  21 ----
 drivers/net/wireless/realtek/rtlwifi/core.c   |   2 +-
 drivers/net/wireless/realtek/rtlwifi/ps.c     |   6 +-
 .../wireless/realtek/rtlwifi/rtl8188ee/dm.c   |   2 +-
 .../wireless/realtek/rtlwifi/rtl8188ee/fw.c   |  38 +++---
 .../wireless/realtek/rtlwifi/rtl8188ee/hw.c   |   6 +-
 .../realtek/rtlwifi/rtl8192c/fw_common.c      |  38 +++---
 .../wireless/realtek/rtlwifi/rtl8192ce/trx.c  |   5 +-
 .../wireless/realtek/rtlwifi/rtl8192cu/mac.c  |   5 +-
 .../realtek/rtlwifi/rtl8192d/trx_common.c     |   5 +-
 .../wireless/realtek/rtlwifi/rtl8192de/fw.c   |  38 +++---
 .../wireless/realtek/rtlwifi/rtl8192ee/fw.c   |  58 ++++-----
 .../wireless/realtek/rtlwifi/rtl8192ee/hw.c   |   6 +-
 .../wireless/realtek/rtlwifi/rtl8192se/fw.c   |   6 +-
 .../wireless/realtek/rtlwifi/rtl8192se/trx.c  |   5 +-
 .../wireless/realtek/rtlwifi/rtl8723ae/fw.c   |  38 +++---
 .../wireless/realtek/rtlwifi/rtl8723ae/trx.c  |   5 +-
 .../wireless/realtek/rtlwifi/rtl8723be/fw.c   |  58 ++++-----
 .../wireless/realtek/rtlwifi/rtl8723be/hw.c   |   6 +-
 .../wireless/realtek/rtlwifi/rtl8723be/trx.c  |   5 +-
 .../wireless/realtek/rtlwifi/rtl8821ae/fw.c   | 116 +++++++++---------
 .../wireless/realtek/rtlwifi/rtl8821ae/hw.c   |   6 +-
 drivers/net/wireless/realtek/rtlwifi/wifi.h   |  30 -----
 24 files changed, 225 insertions(+), 282 deletions(-)

-- 
2.43.0

