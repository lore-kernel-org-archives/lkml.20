Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D6F480DC4
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936120; cv=none; b=cZsSYz6SvB2X/J4qmGtVZ9bGVSAvJxfnyGh+Yoz2FvGusoV221jaDUiWQgIZo8trqN1ZsEFYzbPFRtic6fybi8Il+k0aSFz/7AICZkoV+V/ReQFb6lXxINCDNRIxCFYodTnpPr21XY4OYjfsk+9RN7Di4vhEzrK9tnUSIAHrdwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936120; c=relaxed/simple;
	bh=cOwrh9jpTZeQiI6SbZcf3m+Jd0n4kWeDMVWawhuV7hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DYZwg45Fc3cbfbKp+lZtrmqNVyYYJ0hbKGsJk4u4iCL4cfjDHxNx/jjyvPqmhXqDScyJnsTxu+uOjvGzByzSF89DFgsnuTjgOksTUBVCjCf4Oc4D7rKj+ygiaEqM6+7NnA7UztFrqO4GfbIYSgr6b7CjcjgQmyIEtrU0eLtpvjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtopClY3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtopClY3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 646A61F00893;
	Fri,  2 Oct 2026 10:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790936119;
	bh=y9xk1+cV5/Az8WbBBuj0dZJ1aOiMS4WnFFmMLx6GZos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gtopClY3jcmUB4j6pz/em9q7sWCLvAHGmvRL8FTrb3z9gATWc88PVVysF6nywrT5i
	 XMkTVHdyX7NxlIt1mdEBxljv8dZUj6fJGzhN5qMhtvYM/R2NpCBndaeApgHUlQ0cny
	 ABOfwAgtoxXTDc5A9apQMaAYQaiRUMI0ZwtWpwhuwVcMgyYPJ+bp1/iKInXfef9Vnt
	 4r9iz/ad3OTn6D2hkcXpsilJojglCsNyPbybHjvOa0tfC77J1qxZ/63p9s8zVnNHSq
	 BHrG9nxQ0Eu+wFeRYtzm/t/xZkMmEUvYR4fHP44IiNhfAnacey90SG7DVZeNzwRr9y
	 rBh3tCVZN5GKQ==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 1/4] slimbus: fix typos in comments
Date: Fri,  2 Oct 2026 11:15:03 +0100
Message-ID: <20261002101506.1084743-2-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002101506.1084743-1-srini@kernel.org>
References: <20261002101506.1084743-1-srini@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hemanth Selam <hemanth.selam@gmail.com>

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 drivers/slimbus/slimbus.h | 2 +-
 include/linux/slimbus.h   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/slimbus.h b/drivers/slimbus/slimbus.h
index 00a7f112574b..3a03993c3ac8 100644
--- a/drivers/slimbus/slimbus.h
+++ b/drivers/slimbus/slimbus.h
@@ -325,7 +325,7 @@ enum slim_transport_protocol {
  * @prot: Transport protocol used in this stream
  * @rate: Data rate of samples *
  * @bps: bits per sample
- * @ratem: rate multipler which is super frame rate/data rate
+ * @ratem: rate multiplier which is super frame rate/data rate
  * @num_ports: number of ports
  * @ports: pointer to instance of ports
  * @node: list head for stream associated with slim device.
diff --git a/include/linux/slimbus.h b/include/linux/slimbus.h
index ca6f1da4bdf3..1a2d3aa0e033 100644
--- a/include/linux/slimbus.h
+++ b/include/linux/slimbus.h
@@ -98,7 +98,7 @@ struct slim_driver {
  * @start_offset: Specifies starting offset in information/value element map
  * @rbuf: buffer to read the values
  * @wbuf: buffer to write
- * @num_bytes: upto 16. This ensures that the message will fit the slicesize
+ * @num_bytes: up to 16. This ensures that the message will fit the slicesize
  *		per SLIMbus spec
  * @comp: completion for asynchronous operations, valid only if TID is
  *	  required for transaction, like REQUEST operations.
-- 
2.53.0

