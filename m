Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792951893;
	b=2MD/8LoPGhaY1V8Apvea7rYdxWeWM3i5KrpqT9SKpCkUH5CiwvI2oyB7P0FJni3kB35+
	 Ut+o1lt2+R+auo8kL0umiyUEf94qTVoAIvvynKIy9U9M0s5u1WJ7W4eD91GA8WeUlmVYM
	 zJq60CZXiTYfsmhJJw4QtKu9912L4ndItiztth6HXp7zX7+x9PRuKMZ6b16tgnYvEixrY
	 ZQI5J0Z9TaxIbtCgjLEMelnziVDQ8Vhc3R4AK+0msoyjME6zCJowchZWU5EBuZvjJnJL7
	 AbIrpVFqvgMI0u1OANNnbPAjU1BHtkd9iQ2eRcPXH+lfKO1KCS9ZTQdtXPSm3eqWmzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792951893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9WjZ53v91Udvhflq6T6n2CXMPqhGqv+vK8tOndZRFq4=;
	b=PZEXwWwV0ntSviaTMDTdKPw/Nv4rz6BVRhP9/kP8aHhwv0/NkBFXpjFlkHkO1f8pNCcc
	 1sznchZu/s683ncCWXTYfOUNNag2KaPFHfqmWdlKJ30OsqT1rFpN6llW+H2hVgXi6MYxi
	 1ekXs9Np1jDbvVoKFrxmpdJTvK31ketx2F9OxsWeCiKN4U7Twr8gCajLynSCbKE0yMSy0
	 WiMjucSKMZz64xAExVjrCoCphqZslzH8qmwcg1eb63Kjh1Zc9nS/zIcnjWDmbqcDXZAGb
	 kY6imHgjgJehpudOJiS486nuK6W3H24k108PFTYEwvbof2xy7kkw6dU0aMCFj45Zpmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GPqgI25X;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4F9606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E4F9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GPqgI25X
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df8fe8513so2159997f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792951892; x=1793556692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WjZ53v91Udvhflq6T6n2CXMPqhGqv+vK8tOndZRFq4=;
        b=GPqgI25XFIOUIFfWoKmMCvrk5cFUmTbN3D7T+zxUCZKFzIUj5qgVISTCWBCCSZ/JD9
         413WsihAwqO1RITYGxNBoXS+AjxFnRv2IvxW2wUQ0h2FekFtk3DGccJddtacCoNXHHH9
         mVF2D127o5jSz5IvhxJTpp9/F6uBYURYDJLFza4HeDm1jfD6dvunn8InUErpOf3Rku8R
         oRzI44pgSrZYmRq1rYCvxDT/i0HgO6XJkjD1cliD2+C0Yo1t2fPpji1fQ3dE0JjYACO1
         uWPDcsq+cZtNTqyE0LIj2Jl+vRDgnJU1YnuJrwcJjhpDz9z+Luj2YfzwdC+d/IOlr0W3
         IWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792951892; x=1793556692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9WjZ53v91Udvhflq6T6n2CXMPqhGqv+vK8tOndZRFq4=;
        b=RQ4i1g2M9OdilCkdYRbSpuZNw6KcQ1G7z4KQoKVg1TdQY10EwdihCUZvfbH4s5Ml5X
         V8AWHfQsDVg5BBQiaawwUZgJ3Ny5LwGuU1IAwKSXauN4zpj5+rPmOQM7EFL1X8hnBLgR
         5WeoqyWzfWWq8RQtCd9E0qRrsLX9+/r7/FDhAzvOkpvsmYDWbOSuO13CYRj+Q0U6Zhdk
         qDeRyTdkvuzUPCbdiNc8lyBsWJmMbB5IFeOnioT8pgHMl+lHvvCElmDydAExou4rjFyq
         zFebIuvTTKMgeY+97gdKppDnXZVLcT7Jraw40vYumvsao3HEy+mAlpj+DqoReP5f0YRk
         BYJw==
X-Gm-Message-State: AFq9FYLto0lzZhoMv5jbMhMVcWMPjRL4Zpas3IazKlujbKiqRfSj/rE5
	bUOLMoPdtvy2qVI6pKXMAqgaJSKKdRvB+hqXfK6ujGxQUQw2UMfQ4H/1v+d5
X-Gm-Gg: AYBFou2LrUqDW0vT5u3jTbhcFS0qj73VU7GsR2jqXDeZf/naIBoSa1jthstsoDN33Dc
	62UxDZuW+Sd73kxsHjmMmbU3DmW3ZzpwNb6ilvLtySDZwniV9oEgLXgmwjKotrJ3du6CwN2yVRf
	wx3WB1KwbRqDWR2wYhs940jcqir6nJm4OWjHsvnDrLhtDhYSrShLhm5WrRf1LjY7VRkGeE/56LO
	n6uO82EBAa9EE4t/yNYzLCLILyobm8EvRQZUB8rlZVxbWeTQmMx3WtHk5U/oWWlD5cWXj1mL+P6
	fNJ726MUMeSYEGBW/Wa+mo7Y1lUAcKxzvHKGhKWshB2uePGlT0EqP5qB7Tfj9dJ1x91D7A1Hs/Q
	9e6U2fP9q8aG5AQOznjMTYimjzFGfvojsuA16DIcIrcAW3BQS5ytFMV6dowU96P1Sxv9t8TqU29
	0v2gtiGx7bgNqdd2Lby5mAnm6BekEYaip/R17zyyoPR8+6GJ81QoNxZVwEv/X5wlR+FWrzwsOIy
	1odnIZH1z0FfFTQ1F883sp0McC+GbF30tGUOQ==
X-Received: by 2002:a05:600c:6749:b0:4a2:e0c:2b10 with SMTP id 5b1f17b1804b1-4a35aca32e1mr76300305e9.19.1792951891663;
        Sun, 25 Oct 2026 11:11:31 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa097sm152124885e9.3.2026.10.25.11.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:11:31 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	briannorris@chromium.org
Subject: [PATCH wireless] wifi: mwifiex: validate scan response TLV sizes before indexed access
Date: Sun, 25 Oct 2026 18:11:30 +0000
Message-ID: <20261025181130.3711823-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

The scan response handler indexes into TSF and channel-band TLV arrays
using a loop counter derived from the number of BSS entries, but never
checks whether the TLV data is large enough. A firmware response with
fewer TLV entries than BSS entries leads to reads past the TLV buffer.

Add bounds checks that verify each indexed access falls within the
TLV data length before dereferencing. Initialize chan_band to NULL and
fw_tsf to zero at the start of each iteration so that a short TLV does
not leave stale values from the previous BSS entry. Gate the
neighbor-discovery branch on chan_band being non-NULL to prevent
dereferencing an uninitialized pointer when the bounds check rejects
the current entry.

Fixes: 5e6e3a92b9a4 ("wireless: mwifiex: initial commit for Marvell mwifiex driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/wireless/marvell/mwifiex/scan.c | 23 ++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/scan.c b/drivers/net/wireless/marvell/mwifiex/scan.c
index bdd4b8465863b..4c4bbd4b3b73b 100644
--- a/drivers/net/wireless/marvell/mwifiex/scan.c
+++ b/drivers/net/wireless/marvell/mwifiex/scan.c
@@ -2208,6 +2208,8 @@ int mwifiex_ret_802_11_scan(struct mwifiex_private *priv,
 	}
 
 	for (idx = 0; idx < scan_rsp->number_of_sets && bytes_left; idx++) {
+		chan_band = NULL;
+		fw_tsf = 0;
 		/*
 		 * If the TSF TLV was appended to the scan results, save this
 		 * entry's TSF value in the fw_tsf field. It is the firmware's
@@ -2215,17 +2217,28 @@ int mwifiex_ret_802_11_scan(struct mwifiex_private *priv,
 		 * received.
 		 */
 		if (tsf_tlv)
-			memcpy(&fw_tsf, &tsf_tlv->tsf_data[idx * TSF_DATA_SIZE],
-			       sizeof(fw_tsf));
+			if ((idx + 1) * TSF_DATA_SIZE <=
+			    le16_to_cpu(tsf_tlv->header.len))
+				memcpy(&fw_tsf,
+				       &tsf_tlv->tsf_data[idx *
+							  TSF_DATA_SIZE],
+				       sizeof(fw_tsf));
 
 		if (chan_band_tlv) {
-			chan_band = &chan_band_tlv->chan_band_param[idx];
-			radio_type = &chan_band->radio_type;
+			if ((idx + 1) * sizeof(*chan_band) <=
+			    le16_to_cpu(chan_band_tlv->header.len)) {
+				chan_band =
+					&chan_band_tlv->chan_band_param[idx];
+				radio_type = &chan_band->radio_type;
+			} else {
+				chan_band = NULL;
+				radio_type = NULL;
+			}
 		} else {
 			radio_type = NULL;
 		}
 
-		if (chan_band_tlv && adapter->nd_info) {
+		if (chan_band && chan_band_tlv && adapter->nd_info) {
 			adapter->nd_info->matches[idx] =
 				kzalloc(sizeof(*pmatch) + sizeof(u32),
 					GFP_ATOMIC);
-- 
2.47.3

