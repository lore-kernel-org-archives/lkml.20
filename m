Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.63
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583941;
	b=X0pbBiJQ/FrFEcV8QSKSUNdnT2Y7LyP2p2zaySedJq/02RuHhxSMORvAs7xRUQ5iROTj
	 N61PKNZ3IFqNFr17l36NirFPU74NeqxG8GguAS3uz4ntHCUhCYEpDVg30xIeVKtS1G/hz
	 E5phXis6KdY0YqAetZhTrg4luaoNm6mxh6kODARh85DxD1t48mnaO3XmBlq3GZyOUqSNr
	 Q0uQTyRzZfzBiSUQD0gaaGV/A5FMlZLmSQeGjhuLA25t9Dt169j0d2WUDpXzhWT3UrJCj
	 fbzxxB2OB6PiOy4eEQyBZEybPlsoId97AFQYPe2+5hUxAya0mb+/l72JFgaLc9wCWpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583941;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=11Tk5pGZKu1fPKXdAm6K6Q5Qt3AiXfDKxf4Srgx27oo=;
	b=aBYd1KYRnETJJrJjoulH135RNbMb0/PQ4zKu2xw24B89rD8pFZPfVpW4RFthma9ZLM+Z
	 zJ4YOOCO4aiS9hLcyexGUj208fnxRKv9xnj2t2IZmhCNlR99ThGyMTp/Xns/NpyN5a+YT
	 DAUNl3uoqdpOk9PgeeI08y2DyyVKDjm9X2j/2XLvvmeH9Bo4wCAK4vWchUXn8tWM4YdXL
	 LqB6IOOdtOyxbjId+/RGiEW0U57ZQYDsEs42jWQOtNvrMFO32jh1m8pSvVY/WIob4Bfpb
	 7pcXpDlyiDNPUF90Gt7fOy4ok0vhO8xM0dQ6BfPRfGL5sGJzagKF5rbuFSKTkq9LldA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uz53hEm5;
	arc=none smtp.remote-ip=91.218.175.63
Received: from mta0.migadu.com (out-63.mta0.migadu.com [91.218.175.63])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4128606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4128606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uz53hEm5
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ejs7eg/7jzc52yLvwbolB9ndLYJj1pFmhFs/YVgC4Dc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794583938; v=1; x=1795188738;
 b=uz53hEm5EKL/j0Eh+4eW6wyHxCHQRh2YxCdB/vKIdJ/kkCyr7SHwhVNdL+pULiGBmJnqXS2l
 egOY/tiY7exBvA6zsRysVHJms8AWGOEzoMiegC/rLeoM3hm1cx8adFf4c60P0nQl9jGPvzAlWqZ
 PCS/cc7PERA5rXE6ZbRaASGs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d3388a6865769908;
	Fri, 13 Nov 2026 15:32:18 +0000
X-Mizu-Trace-ID: d3388a6865769908
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Fri, 13 Nov 2026 23:31:52 +0800
Subject: [PATCH v2 04/10] regmap: deduplicate fast_io checks
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-regmap-improve-v2-4-5dfd6a89078f@nxp.com>
References: <20261113-regmap-improve-v2-0-5dfd6a89078f@nxp.com>
In-Reply-To: <20261113-regmap-improve-v2-0-5dfd6a89078f@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, 
 Lucas Tanure <tanureal@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3

From: Peng Fan <peng.fan@nxp.com>

__regmap_init() evaluates "(bus && bus->fast_io) || config->fast_io" in
two places to decide whether the map has to be usable from atomic
context. Compute it once into a local fast_io variable.

No functional change intended.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 327ae2ea9729..c123bae8bd66 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -682,6 +682,7 @@ struct regmap *__regmap_init(struct device *dev,
 {
 	struct regmap *map;
 	enum regmap_endian reg_endian, val_endian;
+	bool fast_io;
 	int i, j;
 	int ret;
 
@@ -702,6 +703,8 @@ struct regmap *__regmap_init(struct device *dev,
 
 	ret = -EINVAL; /* Later error paths rely on this */
 
+	fast_io = (bus && bus->fast_io) || config->fast_io;
+
 	if (config->disable_locking) {
 		map->lock = map->unlock = regmap_lock_unlock_none;
 		map->can_sleep = config->can_sleep;
@@ -735,8 +738,7 @@ struct regmap *__regmap_init(struct device *dev,
 
 		map->lock_arg = map;
 	} else {
-		if ((bus && bus->fast_io) ||
-		    config->fast_io) {
+		if (fast_io) {
 			if (config->use_raw_spinlock) {
 				raw_spin_lock_init(&map->raw_spinlock);
 				map->lock = regmap_lock_raw_spinlock;
@@ -766,10 +768,7 @@ struct regmap *__regmap_init(struct device *dev,
 	 * When we write in fast-paths with regmap_bulk_write() don't allocate
 	 * scratch buffers with sleeping allocations.
 	 */
-	if ((bus && bus->fast_io) || config->fast_io)
-		map->alloc_flags = GFP_ATOMIC;
-	else
-		map->alloc_flags = GFP_KERNEL;
+	map->alloc_flags = fast_io ? GFP_ATOMIC : GFP_KERNEL;
 
 	map->reg_base = config->reg_base;
 	map->reg_shift = config->pad_bits % 8;

-- 
2.56.0

