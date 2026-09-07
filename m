Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58D9264F80
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 23:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788823908; cv=none; b=VQLC+nfAK4Fbv27ivvNmWUMYkO6Lk8Jp89t0bMHB79fdztCCbU34dJ9q/PtD+XHBkNyPDFqDGa+l9Dvr0J+SOQ8P6r/dewoI86hkmZCLk+rtV+05JlsanV3dKmCufe2xrPKl1xkzrs+olYL2s4AzfgKUoEsglYCe80tEuCVD1BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788823908; c=relaxed/simple;
	bh=HgDN1MpFbS4W/vsKCiwJPQjvz53zJEphIjgnaPy0Y2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJCGVQv3CZdqCYrd8jZlqSe9P8eBh9u9MqinVz2jrpGjE71O0UiphLJ4fOlSUlLH6KRMCd4qIsxhSirgSqfvquMXbe1KSAG8xgXOGpVX/Kf+Jni75/7Vga796ttfGNXrwJGmkHIOvQzs2k5cX7kwH/2t4pqf6iKrrtyBys0Ar3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzzUmtUZ; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzzUmtUZ"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc439bfb2d8so2442949a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 16:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788823906; x=1789428706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B8uEeW1oFdxHFuFPP5kN2+8012BsBDEccQ4thUlP5Kk=;
        b=FzzUmtUZtxYV1Cyty8nQp9PLzWSQVJc+7PNCvmwYfAc+IRp5vqWycjKSWEZQMv3U5I
         7KAIYHFfidQJdjS8w2MuRAnZzfMQ0lqDRmPTAL8DOQstuScFLB6GxY6BJ/C3+6k2bBrd
         JS2k90ls05GcWr7VR69Kvny1M2Y4BTw9mV/lE7cNrDTV1NCcXIwb0O+3wMqaeNgOJg5r
         CjK24LYG8eelTamF03GsL+yOL71tQ1c7geAHrf1YvGJd13d7ZvUbhWWfnRPFxNADJBvw
         EqwKJWxo7975AeMq8KzCeJAEq5UGGgEvKw5Mv/kyTqkAvOHrFon9zVx4PE4LkKBNso/o
         7vfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788823906; x=1789428706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B8uEeW1oFdxHFuFPP5kN2+8012BsBDEccQ4thUlP5Kk=;
        b=EnyHCSAHblDBitez8BysgE1i2Uodo7MaYYbAmsQbpZhWuv6SMAGgFKKfSXi8rIDcs1
         JziLsFpds5ddGKHUZTHY9qiM3iFpxCUYNZJ1O95VV+RW8+NRIZ05+/yI9U1e4rsELDA4
         V8WbZhqu0WA/gRdCyYq699eqejldQsAd/wCtjxIhuIRHiH1XfU+TlZERqcsWHcmNhdBP
         FzibhXdX4D88lv+ouFt99zCig53mu44e9dlSRyuUUJXn9H1VXaJoIaDkswoGHtZX+whf
         SbzOQiWhmnbQJ+K0eZ0QEXRKFR3fZltLtw3jFYU3mOihwE4Pr3U0BS62gz+jg3VdV/bR
         HQgw==
X-Forwarded-Encrypted: i=1; AKwUvBwlSiyAXCg9NR6D1BF1WVUkm7DUcBrGleh1lHwXZiHXDauWMzTlszyw5qcx6WJ8UO48KMmVZ7k+pmVCjKc=@vger.kernel.org
X-Gm-Message-State: AFuF++ktPbXV9OanFmZbaaqdtdS3R+w7M7w0ycp9JF5r+T1+KEb/4clz
	mJ3igWuyDXqJ1Fbr+7XTjTrJbji6+qURiRQ2Tll1HFbY+oYyag0lBfAp
X-Gm-Gg: AYBFou3ep2HjbyZ79PizzO/dBC3TqDJVSaVStpExbG1a3NDii12R1SNhyR8WdT8LHV9
	s4y6zbtFrKC9Q2E7zvynKqZshNyStra6dNve3rNCvVSncoN3iHYSdDpDr/w3CAJnQYaRcqZL8Fh
	7BdmEQvHWw5DkouAZlD+6DrCRS7hhdKbIM9hF+x2qGalqa6cwI6fsZ0FbrdACO2TTdh8EXrl/1z
	AftBfjStnEfhR8tV36JArzqE8vwfQ2SPzy9AmYbm/zzAMBc/EicL/8WWeEFikc+1T/JdQyplcQj
	8900N5EBG1JMnbUF59qsoqxfHVWDgcc0wm62fT22gq91Ei5ESvi4hngVHN7vV4GSQFd51DmmBbn
	VtfsUZAg8yBChvP/1SChvrFe+ksrEVIP25udkgRE4oWi9vBRwAhOHj+Le4Sji7yc7sEe2qikdb2
	jLott33gx+SQo/mzqqqOVwxjVga3+4pbvm7HMse+6KSTrtyz6IiUJ30Q==
X-Received: by 2002:a17:90b:3852:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39b26272d69mr38739085a91.16.1788823906015;
        Mon, 07 Sep 2026 16:31:46 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::3820])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260f64ecsm23105029a91.8.2026.09.07.16.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 16:31:45 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: erazor_de@users.sourceforge.net,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH] HID: roccat: use reader->device instead of re-deriving from devices[]
Date: Mon,  7 Sep 2026 17:31:41 -0600
Message-ID: <20260907233141.174635-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907225836.8EB8D1F00A3A@smtp.kernel.org>
References: <20260907225836.8EB8D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

roccat_release() looked up the device via devices[minor] instead of
using the reader's own reader->device pointer, which was already set
at open() time and is guaranteed to reference the same device the
reader was created against.

This causes two problems on unplug-before-close:

If a device is unplugged while a reader still has it open,
roccat_disconnect() clears devices[minor] to NULL but leaves the
device itself allocated (since device->open is still nonzero at that
point). When the reader is later closed, roccat_release() looks up
devices[minor], finds NULL, and returns -ENODEV immediately, leaking
both the reader and the now-unreachable device without ever running
list_del(), kfree(reader), or decrementing device->open.

If a new device is connected before the old reader is closed, it can
reuse the same minor, so devices[minor] instead points to the new
device by the time the stale reader is released, causing release() to
mutate the wrong device's readers list and open count.

Use reader->device directly, matching the pattern already used by
roccat_read() and roccat_poll() elsewhere in this file, so release()
always operates on the device it was actually opened against.

Fixes: 206f5f2fcb5f ("HID: roccat: propagate special events of roccat hardware to userspace")
Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
Thanks to Sashiko AI review for flagging this on the prior patch to
this file.
---
 drivers/hid/hid-roccat.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/hid/hid-roccat.c b/drivers/hid/hid-roccat.c
index 53358297e96c..bbaa782fb7da 100644
--- a/drivers/hid/hid-roccat.c
+++ b/drivers/hid/hid-roccat.c
@@ -202,19 +202,10 @@ static int roccat_open(struct inode *inode, struct file *file)
 
 static int roccat_release(struct inode *inode, struct file *file)
 {
-	unsigned int minor = iminor(inode);
 	struct roccat_reader *reader = file->private_data;
-	struct roccat_device *device;
+	struct roccat_device *device = reader->device;
 
 	mutex_lock(&devices_lock);
-
-	device = devices[minor];
-	if (!device) {
-		mutex_unlock(&devices_lock);
-		pr_emerg("roccat device with minor %d doesn't exist\n", minor);
-		return -ENODEV;
-	}
-
 	mutex_lock(&device->readers_lock);
 	list_del(&reader->node);
 	mutex_unlock(&device->readers_lock);
@@ -229,9 +220,7 @@ static int roccat_release(struct inode *inode, struct file *file)
 			kfree(device);
 		}
 	}
-
 	mutex_unlock(&devices_lock);
-
 	return 0;
 }
 
-- 
2.55.0

