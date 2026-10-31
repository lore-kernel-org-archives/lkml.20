Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417045;
	b=UyrTpsOkZZi3g31noJKDPtJziAGT4IdLtlamk8zRgSXMnXLZ8EYLGK/DDZByqQFwJmlF
	 MG6V3v7PbC69ucnI3UM87Ng4A8V+j5sfsa8UVdx9wRDpzhO953z03RIVpMylzoSZkT1Hf
	 C8BaO9MqlV3dG3weMe3RBx1s0ga9PMmF6hOzf3u2uUFm24IQ+GD9X21wph4rfmyHs/SSk
	 FGb8zL9WikpM7g6eAaQAzymr4TV1d4v111G+fXYUNrahWhYWk8fGKGvzWBAKdfWghcN7C
	 v4FDX7NrxzhdI95Eg0IVYIW6BprhtniIRXMwN1GRMBrEdqUOsZnvbMWBhCpDfoL3Q1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x1McsnWGGUKYl9JhMyIsKIk0BaWt0Rp2oRLMufTGv/Y=;
	b=bCP2qJ4/Mn1ceANuQ20OSmui3daE/Rc+uzMPtCw5Jmj6HnRIKw0OKx7PvMd00kEF+1yi
	 qyCipCIoGn8JaKeBgmPaZUSnrYCyBIEvtCgC4FgFSuoUPyTV/Swcxv4wyTObyxR5rNegq
	 wJ2+v2iMy/dwtfKU4/hyQ9cL0gkiVVgj6hLMpM+y3JMChvwvVf2Vmi/ozZ56RMgLT8Vzs
	 YHJkOJukvqa0WfnQ3v3IJ7x2Vi/1PQa69Oonn67RYpc76yuXD8wxywIO1/YXoRfcjGOv2
	 B+c0xg9/kX0NEfCv765o9htvwjNt1/CeMZah8WmoRmvGxTxl3IwwjadKgA3EuBJ+YBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=riff.dk;
	spf=none smtp.mailfrom=riff.dk;
	dkim=pass header.d=riff-dk.20260707.gappssmtp.com header.i=@riff-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ed1CwJYq;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974C8606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 974C8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riff.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=riff.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riff-dk.20260707.gappssmtp.com header.i=@riff-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ed1CwJYq
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so693876eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riff-dk.20260707.gappssmtp.com; s=20260707; t=1793417043; x=1794021843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x1McsnWGGUKYl9JhMyIsKIk0BaWt0Rp2oRLMufTGv/Y=;
        b=ed1CwJYqAGOESnj3Z+mUnQJNeKgByTtQGWvq88fVuusPVTArDcaDbiOMsknqEEKp7h
         54Ngi1qEr7fZ8Ru1Fjt4cZQaviLc65EaYuA1Eq0YiOMD1IrWWMSDwmctEXn5qNB7ShQd
         Ow3cu9Zl5fmr5RJVWlrqWDLOodaX5vZgNplxxsiAoqDk8xk8ALwomHKToj0LDx2KlmW0
         Y3JY2ck1x/W43dYAamrGCUV2mo94qk7eUJU4eyxm/9qMCSf1fPH+BNXScRBbDa86xH8w
         2zDIC+sg4z6pUw4Ll2ripZvRWEcWLzD6uSsfz2xO/oi1Cy2Ntl+rzR3M8hfZqN8z8MSW
         jEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417043; x=1794021843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x1McsnWGGUKYl9JhMyIsKIk0BaWt0Rp2oRLMufTGv/Y=;
        b=zZYzPrRsNR+L9oXVouXbo36w5Dfc/3K+ENX+goH0DErM3gN6Ap4CM33oUcsOyGTXPQ
         RInQUCQygHQpLKpB7fd8nwAJUBuf217P/8VMJFzZKaFIsXcel6+Xyu41BHTz5pgZ4Jeg
         nV0mjwPuptqXJ7kS+N2Lwal8w2TtrmfpQUNoxtJedyK4OjlwW/QBPgqmDg/VyFh2TeXL
         VngwR0ULa/bl0ixXgrAP3nDrgiWXZijHUlac4eUWi9X2nLrSJ3O3xR8Fi39B+QBif4Xe
         XMR0ozsqO1/K60pNSQix8Zg/ibK8Sza+6aG9pvEfDTfgnBuhwdkP2ANgvAKxp+Y0Ybk6
         /EwA==
X-Forwarded-Encrypted: i=1; AKwUvBy5bn3/SIQNPIhTRu1pGVQHj6qv4An+qKcZbCRLyR3fU+0MZvxSew0m08R0zaHxDF01zPjv4sm+/EB+HK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBCxUrATdBJQdGaA6ytQOBuHO/ptscxH/KvCsiHVM5OAPrJ+hq
	MKZ2ZACxTEnlmpcaUSjP8l8IMcppaXLWsMrIBndaDpvApvVsK0gW5GsIOfRjrCLTsNzqxBI8jAL
	fqxntWKmN6w==
X-Gm-Gg: AYBFou0cTtAXOuKNHTS6AYHbAb1JP8x2hlRQMf7VZWXkFlvY8XMoZXKwJCuN3+/IPxs
	6vngP/OjyFaWXmpgo+q1ThufgcQbTPDlwvukCS3AoIshGYLJA7j4O/I24GEV8Yhd4lvExaS9bYM
	xkYR0zOlGdZFSB6tQ12ZyLxy/0BHp+l6FW3JlyAK6wjUt6U8DhZJ5QY+b9ubNmuK/ln4JiMa6dv
	+dvVBERwo6zxNmstaIknoX3/DjWaFFGIOJaBxyejSzUCaLXM03qjKQ5Ud2L4lMNgMWyPy5mxZtm
	2XU2Jv3vd8s7C4j1aFmN7dGebKiCgl8Rwq7tiB++RREFbtGiGgTHrLqSWKPoYYGTxfH54WpGgWl
	gZsDRLdwYW5CM9w6lN9Z/yvgSnjVF0aNiVRSffGPC6zVAAvc5tDA7nGbGEePpiPgTJBlV4WryjM
	JSen/gP6/7tnVVhPZTpDsJgp3v6ByFjc1ELH2AFPtuwa+T4jbPk6V6+AF4DqZzAI8YGz1X+rteG
	qCJM8wXaaca4NS895VawDWeR+QeTSGvRHul+GtCbBe/i2vHGDbUJSUcXI2SoxRi+V/5XHmqT8W6
	p/5Pzp4zMkJAXW62mJUnw+eVFgLHX2DyLnqge3A=
X-Received: by 2002:a05:693c:88cf:10b0:368:2548:c08b with SMTP id 5a478bee46e88-36a4239bcd6mr6791862eec.21.1793417042543;
        Fri, 30 Oct 2026 20:24:02 -0700 (PDT)
Received: from jrx1.tailbfbe03.ts.net ([2603:8000:8e00:53bb:333f:40b4:73c5:a898])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm10920505eec.12.2026.10.30.20.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:24:02 -0700 (PDT)
From: Jacob Riff <jacob@riff.dk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: retry init only while the PPM is not ready
Date: Fri, 30 Oct 2026 20:24:00 -0700
Message-ID: <20261031032400.38349-1-jacob@riff.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAHk-=wjGk9rBTphk1OAwcqGAE1__KJgMr3B-8X4hKFPX8Wm=BQ@mail.gmail.com>
References: <CAHk-=wjGk9rBTphk1OAwcqGAE1__KJgMr3B-8X4hKFPX8Wm=BQ@mail.gmail.com>
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

Commit 254261381538 ("usb: typec: ucsi: retry init when the PPM
answers early commands incorrectly") makes ucsi_init_work() retry
ucsi_init() on -ENODEV and -EINVAL, a hundred times over ten seconds,
to cover a PPM that is not ready to answer commands correctly for a
short window during boot.

It catches more than that. ucsi_register_port() also fails with
-ENODEV when no USB role switch is available, and logs that at error
level, so every retry runs it again and logs it again. Where a machine
without a usable role switch used to log

  ucsi_acpi USBC000:00: error -ENODEV: con1: failed to get usb role switch
  ucsi_acpi USBC000:00: error -ENODEV: PPM init failed

it now logs a hundred and one copies of the first line, followed by
"PPM init failed, stop trying", on every boot, and the retries can
never succeed there.

Have ucsi_init() report the two not-ready cases as -EAGAIN instead:
GET_CAPABILITY reporting zero connectors, and the PPM rejecting a
standard command (-EINVAL from ucsi_read_error(), the only -EINVAL
expected once the PPM reset has succeeded). Retry only -EAGAIN and, as
before that commit, -EPROBE_DEFER. Every other error is reported once
and init stops, as it did before.

Also give -EAGAIN its own budget. The hundred retries over ten seconds
belong to the USB role switch wait. On the machine the retry was
written for, every observed failure recovered on the first or second
retry, so ten retries over one second is plenty. A PPM that
permanently rejects a command now logs "possible UCSI driver bug" up
to eleven times in that second, on hardware where init already failed
before.

Fixes: 254261381538 ("usb: typec: ucsi: retry init when the PPM answers early commands incorrectly")
Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Closes: https://lore.kernel.org/r/CAHk-=wjGk9rBTphk1OAwcqGAE1__KJgMr3B-8X4hKFPX8Wm=BQ@mail.gmail.com
Signed-off-by: Jacob Riff <jacob@riff.dk>
---
Tested on the machine from the Fixes commit (Lenovo ThinkPad X1 Carbon
Gen 14, this patch applied to the 7.2.6 driver): 6 boots, 3 hit the
race, all 3 recovered through the -EAGAIN path (two on the first retry,
one on the second), none ended with UCSI unusable. The single-report
path for a permanent -ENODEV from ucsi_register_port() is verified by
inspection only; no machine here has that configuration.

 drivers/usb/typec/ucsi/ucsi.c | 37 +++++++++++++++++++++++++----------
 drivers/usb/typec/ucsi/ucsi.h |  1 +
 2 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 2f9adf4..9e453d2 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -2106,7 +2106,7 @@ static int ucsi_init(struct ucsi *ucsi)
 		goto err_reset;
 
 	if (!ucsi->cap.num_connectors) {
-		ret = -ENODEV;
+		ret = -EAGAIN;
 		goto err_reset;
 	}
 	/* Check if reserved bit set. This is out of spec but happens in buggy FW */
@@ -2172,6 +2172,16 @@ static int ucsi_init(struct ucsi *ucsi)
 err_reset:
 	memset(&ucsi->cap, 0, sizeof(ucsi->cap));
 	ucsi_reset_ppm(ucsi);
+
+	/*
+	 * The only -EINVAL expected on this path is ucsi_read_error()'s:
+	 * the PPM rejected a standard command. Some PPMs do that, or
+	 * report zero connectors above, for a short while after boot
+	 * before they are ready. Report both as -EAGAIN so that
+	 * ucsi_init_work() can retry them, and only them.
+	 */
+	if (ret == -EINVAL)
+		ret = -EAGAIN;
 err:
 	return ret;
 }
@@ -2249,16 +2259,23 @@ static void ucsi_init_work(struct work_struct *work)
 	}
 
 	/*
-	 * On some platforms the PPM is not ready to answer commands
-	 * correctly for a short window during boot: standard commands are
-	 * rejected or GET_CAPABILITY reports zero connectors, seen as
-	 * -EINVAL or -ENODEV from ucsi_init(), and a retry moments later
-	 * succeeds (observed on Lenovo ThinkPad X1 Carbon Gen 14, where
-	 * this affects roughly half of all boots). Retry those like the
-	 * USB role switch wait instead of giving up on the first attempt.
+	 * -EPROBE_DEFER: the USB role switch is not registered yet. Wait
+	 * up to ten seconds for it.
+	 *
+	 * -EAGAIN: the PPM is not ready to answer commands correctly yet.
+	 * On some platforms that lasts for a short window during boot
+	 * (observed on Lenovo ThinkPad X1 Carbon Gen 14, where it affects
+	 * roughly half of all boots and a retry moments later succeeds).
+	 * One second is plenty for that.
+	 *
+	 * Anything else is not going to change with a retry, so report it
+	 * once and stop.
 	 */
-	if (ret == -EPROBE_DEFER || ret == -ENODEV || ret == -EINVAL) {
-		if (ucsi->work_count++ < UCSI_ROLE_SWITCH_WAIT_COUNT) {
+	if (ret == -EPROBE_DEFER || ret == -EAGAIN) {
+		int limit = ret == -EPROBE_DEFER ? UCSI_ROLE_SWITCH_WAIT_COUNT :
+						 UCSI_PPM_READY_WAIT_COUNT;
+
+		if (ucsi->work_count++ < limit) {
 			dev_dbg(ucsi->dev, "PPM init failed (%pe), retrying\n",
 				ERR_PTR(ret));
 			queue_delayed_work(system_dfl_long_wq, &ucsi->work,
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 1996f04..140d34e 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -491,6 +491,7 @@ struct ucsi {
 #define UCSI_ROLE_SWITCH_RETRY_PER_HZ	10
 #define UCSI_ROLE_SWITCH_INTERVAL	(HZ / UCSI_ROLE_SWITCH_RETRY_PER_HZ)
 #define UCSI_ROLE_SWITCH_WAIT_COUNT	(10 * UCSI_ROLE_SWITCH_RETRY_PER_HZ)
+#define UCSI_PPM_READY_WAIT_COUNT	(1 * UCSI_ROLE_SWITCH_RETRY_PER_HZ)
 
 	/* PPM Communication lock */
 	struct mutex ppm_lock;

base-commit: e971f4f365bad51d01bc90db55b56fdb3124f963
-- 
2.55.0

