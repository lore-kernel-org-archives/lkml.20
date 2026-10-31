Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.74.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793406243;
	b=Qk2+Lm1RgsGyidq2qjDBN6xtRcQLBWuB2lIGQrbuX6WY+X+epQkkHjyidaMjTHtMEh5o
	 pW3qL97NA7L87Q0Na3Vikz0vnWv8VQiE2gIr+Qn5jQ5kWl8Zvorpynnnxs7W2gu2mOSin
	 3jpyAlK7I0Vxrc85nia2qnxLrCmhZIWCIoVGsNhDNp22xLfERV+FhmurTIePkUit97B0t
	 kTEWMn+Rzzlh/1xRKZmBgfbbKsCZnBTHUc0wC9cnDaOib5FW0xyH2So5ukt4UrhqiGHIN
	 tyWj6oYQvIbici+6nev3YDkeTV/l+NlrxjbLoDzR7fULQIWKc/gTI8wYkv/uU1iq7Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793406243;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Authority-Info-Out:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-JNJ:
	 X-Apple-Category-Label;
	bh=0F5BH0YvZ9dL/0W4kNjNeYuqdudwoo+1eZzsxrjuQIo=;
	b=x3aIsfc+JB1GL8kD5TTjYtdSWNE0HWklZ9J+3flaPnrkSNHCPNHk14yssHkI3hTbHVju
	 gS6lxMWsz8PW6ytqW7Gi4tEYaXIfGIbEArYV1hVatj95mCj+RCGmsXPa8msbW4psSJG6u
	 Kd3JdMCiKZBxvueX/QQ+X1nRS4IxGwqOcupGMg65y6wVw0kIeGdrBx+Ee1wvRUjDPMeuz
	 IqLRZ73vvI8W/qd6t4TYFnMNmmqE4Wu5Ta0J/QHrmqzl+1o2mfsbj0D8zGntKbcDxNhT3
	 xkxdZ/It77/t0Dq2pp9aksIu+syAzdIjfyaLsPF2JUUT/pAWmEZ2KduI/qKYkTWzvvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=Jx3ZXWhu;
	arc=none smtp.remote-ip=57.103.74.146
Received: from outbound.ms.icloud.com (ms-2004h-snip4-5.eps.apple.com [57.103.74.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6DD606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A6DD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=Jx3ZXWhu
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-8 (Postfix) with ESMTPS id 99BB318002EB;
	Sat, 31 Oct 2026 00:23:59 +0000 (UTC)
X-ICL-RepId: 01a18f57-82e7-7f77-93db-feeffc9d799c
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQ9PHV8ZWQBDF0kLWBcOVk1TF1ZDUxFTFFY4Wg5bBEcUFxtcABcNVk1QG18CQg8cE1YVEx9UVgVQUR1fAgoERwRbF0YDU0VfAxcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8ZWhRcGFNFUR9UWF4EU1YOQglKBVwHWANACUoAXgVFAUMPSApAA0ZYH1xWVxdWD10wUBtfAkIPHBNWFQ1NQxJCFQQRUAFYHlY=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1793406242; x=1824942242; bh=0F5BH0YvZ9dL/0W4kNjNeYuqdudwoo+1eZzsxrjuQIo=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=Jx3ZXWhuLTS4E9S+dN0linD3PPRjPcuf0U1r+fWinMpFAETkfU7c1UbxFUdxjd/IhDkThL8P7PhM3LxUEfwzl6FuSfmljTQwg5AtHKQFN3uRk+8XTqVtF252PjqdNe7JUXbf4eJKEJZnpv+k70Ohcs0cR5Knyz2rpCRpMcMTs/c/tBh/l4j664c58OLtwiZD1GJhjk7M5APM0xqoLCDejX8TIv6OgDgVTI+lk/Cpd6tK+RLfZYVwIZ8S/Afb+MirnT9S8GRF2Ft9spDZxkEOogwdVQEGkQeIkdbaypnCnL4mEXcDUG3MIkY9Y6c/ojnCllp2cvZYkF143cZHpqM5/w==
Received: from localhost.localdomain (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-8 (Postfix) with ESMTPSA id 5DC6818000B1;
	Sat, 31 Oct 2026 00:23:58 +0000 (UTC)
From: Joe Dzado <joe.dzado@icloud.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Yong Zhi <yong.zhi@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Dzado <joe.dzado@icloud.com>
Subject: [PATCH 3/3] media: ipu3-cio2: give each CSI-2 port its own DMA channel
Date: Fri, 30 Oct 2026 18:23:32 -0600
Message-ID: <20261031002332.33609-4-joe.dzado@icloud.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261031002332.33609-1-joe.dzado@icloud.com>
References: <20261031002332.33609-1-joe.dzado@icloud.com>
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
X-Authority-Info-Out: v=2.4 cv=E57AZKdl c=1 sm=1 tr=0 ts=6ae53520
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10
 a=VxgYvlp6VsgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=Jwb-u_SVvJQCqV1XEJwA:9
X-Proofpoint-ORIG-GUID: jWMnZu5iqITxVqOO3NSE9e6tbgpGgMon
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAwMSBTYWx0ZWRfX6ehfTYw8v9L6
 ePpkAa3mACz2XXNNd2M8pLsSlPOjTtaPXpVVOgyFiBI5X9nSpGIn+t2/Zb6N+HmQ3QkQ8UYnl03
 A297PQV8vGzwaoZeX8hlAR0s2qssL6bRZ9bWChsR73MwH5QDrIgKsKnbjNdupbtu/nup3wSPZOz
 P5vHecXol/ioJ8lpSHVSi1JxvjUOmdbB+sr7KtFOLrszr/pzJ36BaZ4gv6/gvn/xjkgJ6B2w+O5
 7RKLdfQBHuUYo0/fsV3j1i9hDGne3sfmYT6Q3VJhu3BmFIwzmgyCk66eNEMm3OsYsf1OHdd0qQW
 ItH4IkzRttENM3Ux5wrQ7X7jLnJoq9/DrQA6MfuJGcpi8lroOLKhKRVFC9gVEc=
X-Proofpoint-GUID: jWMnZu5iqITxVqOO3NSE9e6tbgpGgMon
X-JNJ: AAAAAAAB8P1+lwdENPb/sCfNkqZczZ599vXykHL7DDXcOILmLFgBMa3C3R83cbCEesbQmF
 8LnilLJXdn4CaEvn39ODnSJl2P0c2HotG4jmwrVkZjbFmPlnwq0hglJI0qvCe4FClLqbnh
 29SL+G3xC0x41ZgaPMw0LvPhcuNyrGq7wg4sqOUwp4T77AZ6QphkXqIJ34tWCAp+2LkEWm
 9ePqvYWy9/JNRyFwNOF+X9Gb8aYPeHWrgH0eMYPZShqS2ahPcQtO5W88t3nEzZUR3ZASpK
 Q/wBjXkRwj5geoL5+Y260bMUmArZit7lo4oTVzTw1usVQR5UWHt1DQJIt5TnGDR7FaeaEX
 Lnnqt3WSIWCDuU4nMwjRnjyZCogDTj8OExX94sMNpBdzSmRIMdw0BHJtma5DKf5lxx2iN8
 tnz+ytQcY1SUGSJr1j5MNspyzDGkWkyaWRbyyVzSR0Gqz2KQbnz4/5SnadFyrFVSDktTMd
 nspb1THoOI8XhNSdXO5N5dtXed+71ulSKOFBLQVo8s2Ssgy1hYBarWdoyCpNcduvGPS0TZ
 sxiJBtj4BXYXbz3SRPVxXQSGBwlHoGLkKt7Zai2Dyq2YM0z4D2JaaIAccXOLai/VsFxSBx
 93Tq5FxcV9zBnwXWNpLl1cdBCWsmkFeu/6n3rIrlsyouD6BJHFJOS1VNNJyWZ7HqMOwaK9
 26lpE/RtoB+8VylM7F1Alf+KZVWhEvZUl9SbxigUK2VrwvraX5KVAn3t1o+DZhBv5Ggu2l
 +0IUyVt5RhHLTugkbfWFczkn9bpp3l6Y8VN9xiAdcHZ41dxw/ew6rP60i6er9KQnQuS2Oa
 W+vjJ7+Rrb67DINA9wcp5YJtNQ==
X-Apple-Category-Label: MTM3MDgxMjY5NTokY2F0ZWdvcnkkX1BlcnNvbmFsLA==

Map queue N to DMA channel 2*N so several sensors can stream
concurrently. Even channels are used because the IOS interrupt bits are
shared within channel pairs, keeping every queue's interrupts distinct.
A dma_per_port module parameter (default on) restores the old
single-channel behaviour if needed.
Signed-off-by: Joe Dzado <joe.dzado@icloud.com>

---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 071c5ea4a..f92ac4010 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -350,10 +350,18 @@ static int cio2_csi2_calc_timing(struct cio2_device *cio2, struct cio2_queue *q,
 	return 0;
 };
 
-/* Each queue (CSI-2 port) owns one DMA channel. */
+/*
+ * Each queue (CSI-2 port) gets its own DMA channel so several sensors can stream at once.
+ * Channels 0, 2, 4, 6: IOS interrupt bits are shared by channel pairs (0/1, 2/3, ...) and
+ * IOC bits by pairs above 3, so even channels keep every queue's interrupts distinct.
+ */
+static bool dma_per_port = true;
+module_param(dma_per_port, bool, 0444);
+MODULE_PARM_DESC(dma_per_port, "Use a DMA channel per CSI-2 port (allows concurrent streams)");
+
 static unsigned int cio2_queue_dma_chan(unsigned int port)
 {
-	return CIO2_DMA_CHAN;
+	return dma_per_port ? 2 * port : CIO2_DMA_CHAN;
 }
 
 static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
-- 
2.56.0

