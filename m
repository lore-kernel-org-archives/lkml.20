Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793860629;
	b=4Khop1QPQu+VWiKjno/shmCU7zBivKgPmWS2FhioIHBluEUe0hhVJmymoe4y1hY4j5kU
	 NixLT3gjEOdT9UP6WhxzA0650iC5EkKt/TeLg15fmt2b8S9wuPNjo0O/ESOcVprwjbl2R
	 fTl1WifYVAw/tOKbZm5YU13xccqPSVcUUVUPa9nQJjS/jl6JemRaNE8Dhpc+u8SAT+diy
	 a9Mla8bg5aeURGgOFrpf8upA1XkDANlC7BL4TWsAT7fsLXPsAjInWBcF1vndB2PpX1EDB
	 gOhEx3doYOBU5xX8+se12/j3H8AWQ6HRtdZ6SyTvjzP90IObySgsgLfWk0dfeBylMFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793860629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PgBKQLIR6mQBdDXOIGUuD/EXxFIBtVanX8mMwu7/ytQ=;
	b=s30ntYdnoMMxd/VIbMKK/z+4/Az5Ha1+9WjQ3CLb323cxi+ViE3db+mvPKjjCCIDfNYP
	 PZ0ydZYK6vqpWA1SsznSUd2e27Llwd8yX95fE0IeXXDaCtq6Bd2bFsQ6MpLhscVd0eEy4
	 vQ0ZHur4TbIO73o3JAguVB3MBW4jw8YBmY8c9UXuUW89A9QeeI855eQT/X7WGOUZ+uOJV
	 vutB6nlDFTHrl5Y+fyST8KSxzxAkXLYL+lNhr6J+ZbMadE7rXOIKYeiUIxTYW1+3Kc3YE
	 a3vOINyuF3ekX5pY4sJwCVM9FDYnFuXGAYizTit4aU9VF0MFbMseB5P1Ocy+H02rLsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sr8rGKVI;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBCA606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CBCA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sr8rGKVI
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36d6765756fso1633317eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793860629; x=1794465429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgBKQLIR6mQBdDXOIGUuD/EXxFIBtVanX8mMwu7/ytQ=;
        b=sr8rGKVIa167qXWPurxWL2C1cOVTsS5Q7rwhiGgnnunPMztjUAVMDJZcCoWIWfJuYH
         o8744xSGd+iUefH2C3BRF9SPm3EQ9hBOZwcl13C7iV6ltiOcuZ6VgyoJJOXoUDrJc/LY
         tChDKpsvzNfgq3AxYQFDV1WBI2davXMxW9gU4LE8GaUmesJ13KleXd44JF6wmmq/STN5
         4dmkmMmZMWNBwmkRofsAeVLAZJTxwU4lrNTr7p0KLFFRA5xV+vGsrIz0Tctue7WRKgZE
         FB4J+rmQGmUdeYh8r8wMgp1eGvYc1TTRcBaRiIwUTdqU+R50Xl7r52PiXT4ZOaKbsZNF
         f95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793860629; x=1794465429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PgBKQLIR6mQBdDXOIGUuD/EXxFIBtVanX8mMwu7/ytQ=;
        b=BWY5Ku5W99N7CbbbxkgwET+QhqWZAi4hsc2dfFSgsItlHtHwQpFHVnZJqvLFgs6k82
         op2kdH+k1jdsqAhnn0GqNN4X8EgKSUsETKAYSJWgZB4H1FThANZK1fhpz8nntOd5/E/J
         BkPqYyZi/NoKTHNOLLUiySzz1R3NlM0p0MRdeutMxJNP+v1qmB52nFqycMua2pCYugeP
         hcigP6xxoVhrpSU855ESdef6mRUgrFcxEWOrybcEH81nWE75TeZv0xj5S9EGaqOXyzMH
         QraLrPQpKrWhC8VFDqR2tgy4cZI/pUi14rLGUQB6Oz3iDPrcZyDI97zjz8K88c8NFkQR
         RgAw==
X-Forwarded-Encrypted: i=1; AKwUvBzhyG3lwQ91LIwA5lAoAyAwC7Bg3IO3vNDabWclzd1PBEsi4CbrkbQZP7iKxNBTk3HMHwE4msUGlQFEy9s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LmAOjFZ2tBhhXvZPFj3wPDG2rIbBIDSL+EnjmvDxbOfYo6GOU
	L544x38xvY4qi0vCGO4/C2AFSv2gtG6qSRCCAaw87BFXJhlnYOvVc4WS
X-Gm-Gg: AYBFou1+b27nlP/vYheoavQbkpLijV3O/adZ6jDGBN5mbG5XhTRta9/xLUwc5WQrpqG
	pUpr6n601BbHeuV1XnbQnESB9YnT5nH2mvhmeWwTVEL66zFxTfSC5eZHAN5oqt0nI+pZOmOADwv
	HvpgVSYve0x0JkVnDTDbgzMOvTn8/F3e8WZND7vrI5aD4MsbwBLhacXOiOeMbfgylVox0hHHeaG
	79z1+haJVqRz98keWdXHYx6m7/FsrdEEYr01qqphdpANgVJgw3DTxcqKEZew43q8bzpNI8crsF9
	aYZ4DfiHSQ+kLVP7H+oftt6sFb0DONDAsFgLk189H6BvDQJ0SERdQD7yAMmw4bVlit0PbcIAPa+
	agEi8UHR2L6laBI2JsNZntY3nm5h/R9bYTkLEUrpJd7pvaJIgsQonBi8C8gJ0mAwETrTAqA+fm+
	nYi7iQo7s2wN6NBpuQRdBcfSLgFqmPAsJktEPDZVmxxxAZfmFFM/7qLfQiPV9FUSQMGGNkw0Ie0
	GtZH5imzw8BuEZuN8uhNe9rX9ectjwAhXFh3bPdTjkmU6g3zhkl1PLIINRazSNKLAap7E6ozzwo
	JhEVMCG7eYV2Jt5OBSOcVO36y+5wg03gIaVdIl+bciJZX9YYxzV4bQ==
X-Received: by 2002:a05:693c:88d2:20b0:36a:6d52:e16c with SMTP id 5a478bee46e88-36a6d52e261mr15954485eec.12.1793860628633;
        Wed, 04 Nov 2026 22:37:08 -0800 (PST)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36d34d5960esm13148900eec.5.2026.11.04.22.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 22:37:08 -0800 (PST)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Xiong Weimin <xiongweimin@kylinos.cn>
Cc: virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] virtio_net: fix typo in the ANNOUNCE_ACK comment
Date: Thu,  5 Nov 2026 12:06:54 +0530
Message-ID: <181e5d6e056f326b8531f17bac7f4e138812c540.1793860522.git.hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1793860522.git.hemanth.selam@gmail.com>
References: <20261102043526-mutt-send-email-mst@kernel.org> <cover.1793860522.git.hemanth.selam@gmail.com>
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

The comment describing VIRTIO_NET_CTRL_ANNOUNCE_ACK misspells
"received".

Link: https://lore.kernel.org/all/20261102043526-mutt-send-email-mst@kernel.org/
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/uapi/linux/virtio_net.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
index 1db45b01532b..4a458ebb2567 100644
--- a/include/uapi/linux/virtio_net.h
+++ b/include/uapi/linux/virtio_net.h
@@ -316,7 +316,7 @@ struct virtio_net_ctrl_mac {
  * Control link announce acknowledgement
  *
  * The command VIRTIO_NET_CTRL_ANNOUNCE_ACK is used to indicate that
- * driver has recevied the notification; device would clear the
+ * driver has received the notification; device would clear the
  * VIRTIO_NET_S_ANNOUNCE bit in the status field after it receives
  * this command.
  */
-- 
2.48.1

