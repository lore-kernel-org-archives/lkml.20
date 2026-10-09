Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DB13EB104
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531993; cv=none; b=XnbX6cuaS3Aqtp0Gg1oEwMZdPG/F243QgxV9UE20XRKNRfdB3CjbJsUA08xSRQHumyLLBlxND2SP4DACan+PAGyxnvrl2dBqhgkpZpV+JiZlDQYHtlI2ENy02LkqhhlDkt3ueV/94SrZ4epWj8XKW7LNLT/GV0RZyUpVcGK53/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531993; c=relaxed/simple;
	bh=5UfwCc1ztPbU58zjOT2UXglXonLuSJg7MgMauKlNJcc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=RZ30mg+L6+nWYGT5bjLazt0t2NhHoV/HN7Lk7RZEAEY4Dq5PvkoLiYy9aP9pecF098jxUKQUklAkjUOuWsEriin5ahiJAO3xo+jb0rx5bO6DRD/T1GskqM8igFR6G3cjZ4XM7O7MuWG+fTIK4N5Bcyo9LYPyyQMtfY/AY41p2zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N29MAmzO; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N29MAmzO"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c263415982eso531396366b.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791531986; x=1792136786; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zbJFQJQCC5LSxu2UWOhifSFsGk/n+Fgp2JIREniGqBQ=;
        b=N29MAmzOyfky+w3aI2IGePs9+eKIUDBF3t+S3ypAWyRpGBcmhzHi0iMu8U4jmkjiwW
         j/yk26tvFkB1H+eIQWM3qVAB7Qr+UORhZo2jdozO47NPWRr0HKsiyrWFHeb0uQFgggEM
         okn9rPlDuAV7L0QYMda3oETq/OmFo501WBu0KvnPODIivVnAq1k7KIaaFt1aFIUUsrJ2
         PWx1wVymNM8SOP4tVBEL0Us21OEPdVMOfjKovKebkHFq/7YkbZd0w6e1e3fsQBvHysWB
         UJ3Ympo5BQ6wMECTCyp1lhTlGPmVowQq00hGva8+QtRsbRSgvXfHxNlaefZMauC85wRj
         zvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531986; x=1792136786;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbJFQJQCC5LSxu2UWOhifSFsGk/n+Fgp2JIREniGqBQ=;
        b=MnuM/ZN2z3DruIROWbGkiYJ2VNipi+3H1zyuHR/MSJaMfniXIOSxbqBFOzkVLgbQhb
         KJov8U307mySbcY+w0i3Xyur2r6/TF0CM40k6hnNUiMU/WUVMze5m+R1pbLQQbW1VTMD
         KZhq4by/qurb+xSnGObjIrH1EAGeNxJil72EJ+/835TpUfyTEB2g/ZHQvS5vMzxIooPL
         rxLyOHvAEz1zdFdnyuptngK3yXINhnK1iAv2a6l1BMvJjk3FrfF841dyqOzMbf/SCOZo
         xcVnRVYdW4XD0w7sGt0xjZEKvob2iy1C/4FyYNbxnDunV7tZvfzcQTbezjYgSBHO5C2M
         0m+Q==
X-Forwarded-Encrypted: i=1; AKwUvBw3J5Lt2Nvye2BIkg0n50rlmkmgNTmFehtOnK0DSXYZf+MKSwIzJ6oZy6u3UGZsWUXEZ/2AZyT05AMLZhA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQHnttwTOMygWb/mPHy3zVC8XFStweVETDbng4gR9LNAU0klIv
	umtgXrQRIIl9nAbYWKkLQRP0cuHnPHuwBHbQdOZfSTOii4iBwY3ouJse
X-Gm-Gg: AYBFou2ZpFyaZ+j87pqm0wLgCkLuZl57LHkXZ7TSveYdEBSNyFJP3MSnKzqLJBEKcUl
	vIBV4kMI9lqJ+qV0MnA1uNXxqTUMT1BCuDoVQZBykprn9zpxRNtFQNDE7RD6M0AcI3bqaCV8evT
	yb33kokTWdt2Q6JAG3XGzGeYaaSW7Nivy+lyVNMrgIJlFJ0akpWz2pMR5T41baPvbo1Jjw2Z3eu
	enFeF5uthImOWXWC2yBXGkCn0YLqWhGxqRbNLjGECvLSmeCHWKWsZ1Pjt2+aaBMuT/suRSIdNo1
	BKGaqoTNEG9DftM03eh+uuNxwduMm+91w2+Nj+MZSpgSjoTlbkM4mU/8G6SeIZzHKJEuptJ+p0y
	UrnC05YLXdCIufVwT71ucieusAZm5E/BvPpv5C20QNzQy74m3FVBU6gb49dhottvUcj3o+3bn4A
	R4yk/25Zk512NlFCWdkMMzGlfEIDeJEoMEwUydIldUWOFvWbJPpgPn7bbjGvegaDln0Nq8AxaZp
	7kd8Qxt5yTrvN5+P8D/OytJDw==
X-Received: by 2002:a17:907:9705:b0:c2e:7daa:7645 with SMTP id a640c23a62f3a-c31a9ffdf94mr103312366b.23.1791531986328;
        Fri, 09 Oct 2026 00:46:26 -0700 (PDT)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9762a4asm56887366b.2.2026.10.09.00.46.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2026 00:46:25 -0700 (PDT)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v6 3/7] char: xillybus: Avoid possible bandwidth inefficiency
Date: Fri,  9 Oct 2026 09:45:53 +0200
Message-Id: <20261009074557.19996-4-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261009074557.19996-1-eli.billauer@gmail.com>
References: <20261009074557.19996-1-eli.billauer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The host flow controls the payload data flow from the FPGA by sending
OPCODE_SET_CHECKPOINT messages. Fix the condition for sending such a
message, to correctly handle the case where leap < 0.

The previous expression leap > (fifo->size >> 3) was not intended to
evaluate true when leap is negative. However, due to C's integer
promotion rules, leap (of s32 type) is promoted to unsigned int when
compared with the unsigned fifo->size >> 3 expression. As a result,
negative leap values are interpreted as large positive numbers, causing
the condition to evaluate true unintentionally.

Consequently, the device receives correctly formed checkpoint messages
that encourage it to send data, but too frequently. This may cause the
device to send short data chunks, wasting USB bandwidth.

Assisted-by: Deepseek:v4-pro Kimi:K2.6 ChatGPT:GPT-5.5 Claude:Sonnet-4.6
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changelog:
    =========
    Change v5->v6: Rebase to current tree
    
    No change on v4->v5.
    
    No change on v3->v4.
    
    Changes v2->v3:
     -- Add Assisted-by tag to description
    
    No change on v1->v2.

 drivers/char/xillybus/xillyusb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index 9de4298209e7..9182817c435b 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -1501,8 +1501,8 @@ static ssize_t xillyusb_read(struct file *filp, char __user *userbuf,
 		 */
 
 		if (chan->read_data_ok &&
-		    (leap > (fifo->size >> 3) ||
-		     (checkpoint_for_complete && leap > 0))) {
+		    (leap > 0 && (leap > (fifo->size >> 3) ||
+				  checkpoint_for_complete))) {
 			chan->in_current_checkpoint = checkpoint;
 			rc = xillyusb_send_opcode(xdev, chan_num,
 						  OPCODE_SET_CHECKPOINT,
-- 
2.34.1

