Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826901;
	b=k4grydxkBVhfP8yju9GvSY3Gf6aaJgrC2EXJy228wb1I36y3LKulomUyOolShjXzUAUs
	 fnU+UThcgZtM6l7EHFVq3IDo+BeXu/nu/E5V8b0bQv39ocoMuMdrdF7+R+Vn5z8US1rMB
	 HznfAkFU2PYvNXmAUZWwOj6hr0WEd3DTK7PPIlgiiRL7NN7XwWaLZxWdWv7w+0/GaL0gR
	 FxcBqpx2mmI2faGqGncEgbBMDvyixNwM1r1XDXqP4vmylGObUjWGTOQjmwzLq11judIGo
	 lbtYMLMpQCBiwovmrnLCKRbfqDOQU6Gm9JFFK1rHoKg2LQ/WI3bQQPxvVuOnMXH6YYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=z0W2Jd6uVsBM+uJxiCKZYftIMEndVFv4A/cqc5ME9Wg=;
	b=U7ZuLClG6uu1lcKkVi9+6S2eSRnBcRhMLAj/Hn/ezJ56p6gMTPy43anr8VwTDQuPn13q
	 IKfvgRpIBy5uZDvoRA+a6wLFwCNKUaJ/5v1L63hCDt+K1Co4gqg0lakT0ip6xTPplG32m
	 MXMuYmIYhC0P74urXgkLNLbwcGNOMZS7Ro2w47cSnLJd2On5jD803ODNmW3qVJhAhv+Rs
	 gByvQ8t51cS7Ruv/AUa/Ff36XcmaXPU7ULao956Nix/CjgUQFI8ZsuE49Cx6UBDeWwAVE
	 rIruQiXka7eudbwUQu+J1UHDlKucOLHlIGYnCAOZKbySdRXb1NoR3J48NLsLka0+Ubg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q1GWblou;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1CC60B47BF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A1CC60B47BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q1GWblou
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2166491eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826900; x=1794431700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z0W2Jd6uVsBM+uJxiCKZYftIMEndVFv4A/cqc5ME9Wg=;
        b=Q1GWblous/4WJwNpcq9vQcNJKyJUh++qAyNJqKHRdZ45zsrPRiHqBE6fZxUoWPK8l4
         QD0ld/SJHKYS/b5vzDAUh5QVS4Ky8qpTpZloSHYNpR2BXv7QKJGhvZyS1o5t1om9FfVf
         +75z+7zsmLvjuahsq38Bo0D1hQGGa9C8PwJRI2QfysJ56xY9zXqY53jKNxjqP+IIj8gb
         llEVwBiH33Vu88+WTjnO6ccWhk2K3MdnasBEWr1nOUqtWYCNlG/EFuKijqH03k2UT6+j
         OBR5MJZ2++M5JMHciycVsDIZjAq5kP+EyHNaKf2j5Eav6nMVXU9JyPZdV/Q9yl+veONR
         Xw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826900; x=1794431700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z0W2Jd6uVsBM+uJxiCKZYftIMEndVFv4A/cqc5ME9Wg=;
        b=iVnDHjacfys0U350U6x++UDn5euuEzV7SdRvvNeKdIzxr3nEjARNnT7khp+VzjMZd3
         sbVyd3pjhgE6y9gqk5vxtSX4sgjm4cXrVdJ39B7REYiHUaecQVglDsrgP4PRS5im0ydp
         z/WCt+wv79uQzRBoUw0Qjis2fg/F5+mnxbjhhA7aRZx8hUq/+CqBnbOqudJezwu626dF
         2r8y4jh5JuwBUqblFOHOqnNELCuhAEL+u7ie9vspSaKhZpQ6245QO5/vK53JHRbetBZO
         d9hFHEwwVagt1UpcVKo0+aupt0w0EnWVLSBmYDSWPbYH+SgUtDYG3S4dWTqsMzoSr/m7
         5Q6w==
X-Forwarded-Encrypted: i=1; AKwUvByDfM1f73KOpl3A4fkddSnEPCFVOM6bysgvXmlggS4t0OeP5oIHIUjctOx2toGDP9xn8D9RJS6W/8TOipk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YLoXVDluxz9j7KMWChpS8bxjNN9jO/ttpBUdNecOWbyE6S/FI
	cUvWDxMJncmi4llbS99dRBBE5dQazxanICGSu9pVB9UV0GCuTebs/WD5
X-Gm-Gg: AYBFou2DdpK8PTVYwEzIUOQoQjt1AM+YwHTUkeXebLZCGg5eqG3mNT+i8QQh9CvfJKW
	f82RvfQBKHV9C8diUN0eMlBnEUrqfRJF/NE9rQh+o/2SKDIZ6RUAzrTF+CvCSm2Xn0Y/Y0tSo4C
	1G4NxhkhytqagchYCKsbLk7G4twZfFNuwR+4mFrQfEd6MUwYZj7i5z/G/HZN/fmbpyG1oq9Hje5
	xAB1gdur5n6bp/UOnSMl00MsSIsM+LrvC++9fnLUIX7KWBKVByB2mEP9jJAIu8WeIX9OIznoY92
	PO5diyteMbuhL30BEyx4FbiKxH/iugbe6BbZVGoitnuGu1vJClUH0z6Gfs1KHRYcx+Z/Tm5jKUZ
	9BkD2ImXJn4ZbsuZQ/5pCb5eo4wFC5JPmDkaWzMHmMw26QdlSDal3gXmkMfAiXXv0oJkd1eX58G
	8Lk7Q5pvXlqql5sNWdj3nW4FmQb5f9XJ9n9cGoDCJ2SQeZjS772XH9bS6hM7GVKPUFxSG746JDB
	EJk81bucRWfARBdNbgeZZdYBYApDsrvRkTBf9rvWyW7pnzfmMGgQjTkbgNaj3hO9cMaYpuqtuDe
	jnaVuHeSD5GoRkMjhVUayIILX5sw8nJagHQlMom6WW7WU08YzF2CnLu4zdxDit3ZGw==
X-Received: by 2002:a05:701b:4244:10b0:149:1b5b:1f25 with SMTP id a92af1059eb24-1ac5b211405mr26311162c88.15.1793826900133;
        Wed, 04 Nov 2026 13:15:00 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2c2f7sm10606078c88.9.2026.11.04.13.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:14:59 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	sara.sharon@intel.com,
	luciano.coelho@intel.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless 2/2] wifi: cfg80211: test a split MBSSID profile longer than 255 bytes
Date: Thu,  5 Nov 2026 02:44:51 +0530
Message-ID: <20261104211451.693451-2-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104211451.693451-1-wahidzk0091@gmail.com>
References: <20261104211451.693451-1-wahidzk0091@gmail.com>
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

Add a KUnit test with a non-transmitted BSSID profile that is split over
two Multiple BSSID elements and is 300 bytes long once merged. The last
element of the profile must show up in the generated BSS. Before the
previous change the profile length was cut to 44 bytes and the test
failed.

Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
 net/wireless/tests/scan.c | 104 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/net/wireless/tests/scan.c b/net/wireless/tests/scan.c
index 8c20278b5d3a..01dcabf9dbfe 100644
--- a/net/wireless/tests/scan.c
+++ b/net/wireless/tests/scan.c
@@ -402,6 +402,109 @@ static void test_inform_bss_ssid_only(struct kunit *test)
 	cfg80211_put_bss(wiphy, bss);
 }
 
+static void test_inform_bss_mbssid_long_profile(struct kunit *test)
+{
+	struct inform_bss ctx = {
+		.test = test,
+	};
+	struct wiphy *wiphy = T_WIPHY(test, ctx);
+	struct t_wiphy_priv *w_priv = wiphy_priv(wiphy);
+	struct cfg80211_inform_bss inform_bss = {
+		.signal = 50,
+		.drv_data = &ctx,
+	};
+	const u8 bssid[ETH_ALEN] = { 0x10, 0x22, 0x33, 0x44, 0x55, 0x60 };
+	const u8 marker[] = { WLAN_EID_VENDOR_SPECIFIC, 6, 0x00, 0x11, 0x22,
+			      0x77, 'M', 'K' };
+	struct cfg80211_bss *tx_bss, *bss;
+	const struct cfg80211_bss_ies *ies;
+	u8 *input, *pos;
+	size_t len;
+
+	wiphy->support_mbssid = 1;
+	w_priv->ops->inform_bss = inform_bss_inc_counter;
+
+	inform_bss.chan = ieee80211_get_channel_khz(wiphy, MHZ_TO_KHZ(2412));
+	KUNIT_ASSERT_NOT_NULL(test, inform_bss.chan);
+
+	input = kunit_kzalloc(test, 1024, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, input);
+	pos = input;
+
+	/* transmitting BSS SSID */
+	*pos++ = WLAN_EID_SSID;
+	*pos++ = 2;
+	*pos++ = 'T';
+	*pos++ = 'X';
+
+	/*
+	 * First MBSSID element: a 200 byte non-transmitted profile start,
+	 * the profile continues in the next MBSSID element.
+	 */
+	*pos++ = WLAN_EID_MULTIPLE_BSSID;
+	*pos++ = 1 + 2 + 200;
+	*pos++ = 1;			/* max BSSID indicator */
+	*pos++ = 0;			/* nontransmitted BSSID profile */
+	*pos++ = 200;
+	*pos++ = WLAN_EID_NON_TX_BSSID_CAP;
+	*pos++ = 2;
+	*pos++ = 0x34;
+	*pos++ = 0x12;
+	*pos++ = WLAN_EID_SSID;
+	*pos++ = 2;
+	*pos++ = 'N';
+	*pos++ = 'T';
+	*pos++ = WLAN_EID_MULTI_BSSID_IDX;
+	*pos++ = 1;
+	*pos++ = 1;
+	*pos++ = WLAN_EID_VENDOR_SPECIFIC;
+	*pos++ = 187;
+	*pos++ = 0xaa;
+	*pos++ = 0xbb;
+	*pos++ = 0xcc;
+	pos += 184;
+
+	/* second MBSSID element: continuation of the profile, 100 bytes */
+	*pos++ = WLAN_EID_MULTIPLE_BSSID;
+	*pos++ = 1 + 2 + 100;
+	*pos++ = 1;
+	*pos++ = 0;
+	*pos++ = 100;
+	*pos++ = WLAN_EID_VENDOR_SPECIFIC;
+	*pos++ = 90;
+	*pos++ = 0xaa;
+	*pos++ = 0xbb;
+	*pos++ = 0xcc;
+	pos += 87;
+	memcpy(pos, marker, sizeof(marker));
+	pos += sizeof(marker);
+	len = pos - input;
+
+	tx_bss = cfg80211_inform_bss_data(wiphy, &inform_bss,
+					  CFG80211_BSS_FTYPE_PRESP, bssid,
+					  0x1000, 0x1234, 100,
+					  input, len, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, tx_bss);
+
+	bss = cfg80211_get_bss(wiphy, NULL, NULL, "NT", 2,
+			       IEEE80211_BSS_TYPE_ANY, IEEE80211_PRIVACY_ANY);
+	KUNIT_ASSERT_NOT_NULL(test, bss);
+
+	/* the 300 byte merged profile must not be cut at 300 % 256 */
+	rcu_read_lock();
+	ies = rcu_dereference(bss->ies);
+	KUNIT_EXPECT_NOT_NULL(test, ies);
+	if (ies)
+		KUNIT_EXPECT_NOT_NULL(test,
+				      cfg80211_find_vendor_elem(0x001122, 0x77,
+								ies->data,
+								ies->len));
+	rcu_read_unlock();
+
+	cfg80211_put_bss(wiphy, bss);
+	cfg80211_put_bss(wiphy, tx_bss);
+}
+
 static void test_get_bss_miss_reason(struct kunit *test)
 {
 	struct inform_bss ctx = {
@@ -973,6 +1076,7 @@ kunit_test_suite(gen_new_ie);
 
 static struct kunit_case inform_bss_test_cases[] = {
 	KUNIT_CASE(test_inform_bss_ssid_only),
+	KUNIT_CASE(test_inform_bss_mbssid_long_profile),
 	KUNIT_CASE(test_get_bss_miss_reason),
 	KUNIT_CASE_PARAM(test_inform_bss_ml_sta, inform_bss_ml_sta_gen_params),
 	{}
-- 
2.56.0

