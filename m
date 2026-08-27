Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696C541BA75
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822599; cv=none; b=st2BAqsTQV4rtmHu3bHVHnR2RaHfoTHTdrSmLjjvywnwOeyfS+vzM+GyWqqtLP8Tfbq5T90mPhuln1h1sYE4B2RnbT1+tygtYKOZasApwERcfXRBFXR1ii274gCFOZ71+rbKbD0dmGXXcMdGfjG5DvA5PTcsd8mEmckIlD86zJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822599; c=relaxed/simple;
	bh=pilzqgLX23vrgU8x1OrQeeuvR+C3KBcsvDYv0GU7JNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ph38n2BeiUmjeJilQoii2DrWobdzW7qqLvHhjw1mTGlV8DqHT5NYc8WpQZ0IVlL2PV6EpxpZ06JpNNHlMSy6tjIMsbIvVtDAh7g0gs/xqo71wRoE/+bpXT7Z5N8zL+AkE5YmZxY1C/at+GC4emVBKmuKP+2z49toGbuqYFRjzOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+VeMma7; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+VeMma7"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so1596471a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787822596; x=1788427396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaA1NG09mAC26Uk+RbGvv99dkflUecBsEoDtXvZSg1g=;
        b=d+VeMma7DOFPbV6c8HI/j0lD2Gqq6H1sYrechKiHBrPkRzMQ+HWEP7v43q39LCnFcV
         4wRcbQIOCX+/f3C/ptkpSKCXcb4GJoYEJIqVi+Yx1YM6FtyoTv+BFYtonlk0PVXCGPSV
         aPWm8zZn42fKiYV8QNv+d7yOdCD6Pj4Z1jOwfwyi7y9ddr6fruJGVvg0xBW/o1iWXHL/
         ISvavpbGdK2QiHtJBTV5eklEmsGa78nQEY1uaMBkCYoMgjpVgo1WTzku8Nbn1AkJZqzR
         7WHL2CqaOE3bIQ4tK6VBJrYfk9DK5sJu0b+Rp37hcHCkrYwNr7pfjT79hv6qTNsPkbZp
         +j1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787822596; x=1788427396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uaA1NG09mAC26Uk+RbGvv99dkflUecBsEoDtXvZSg1g=;
        b=sDQVTiqCAIq4L7xIzbVBSY9X0J++wW1j389wPe4DgGpRzA6ITupmKD9OfqAyGZMOnz
         Lc8jleXcqnD4Wmnk2pYpKEQpKxyx3VQZYZLgKjVFz/3qPLgSPjZ4GY//9A7zYRk//Fi/
         ksyk98xl5GVwTDFBcEPJNOkd2Td0P2EiBxwlaCQxYYS3TA4Ch+ltekLs45pD0fv/EV+Z
         9mH9wHKtyYwJKr/1zbTidY/j92fySFzHZeqdJ4crx1gZ5TPJ3tV3Ghd+8VCS1pck07b4
         dQC5/rHeVuurQNazDFseQUQqYvfgAqk+gYS4o3JMHLvgbdSbi0/yBJX8MnyTB7R8jpHF
         Lx1g==
X-Forwarded-Encrypted: i=1; AHgh+RovULyu3/YYgfidTPL/b3hFeN3WT8xMFCkOGwbRFPGqIYVyPkp2Z8UCQuBMvK5Pda+FNUURR5W9E3/c61o=@vger.kernel.org
X-Gm-Message-State: AFuF++nd5lGPo02Pkn5inBoQay5/0w1Uwa/M5V9qRC+znyV6B5CcOInS
	ODjlB/tk4WeBcaUmumXx5N/PXUWIezitWev7xmxrjBF62BQcg8d5+/5U
X-Gm-Gg: AR+sD13Q65OAW4v+hkPQVulQnjaKW8fzaOaMdHIeJE46NoNNhlRpnNTRjkJXwnH2ssC
	bxmHzu4NTtXHORi8SOBgV3rB3AeIbsiyZci6nhsYPVUFPpq3pVcDM6vZeluJb58XYhFxKWAf5oO
	6120QPbanZOk5S60exzs+0GLYFhoVW82CmG0njfbNFrIMKlLxpzPiTAJk+rpt1Qvw8znxgkFNHp
	Oihd1qERtNA0G1/FaeHVWBSQwyv/F+R21YzKzReTdOFJK5q+1vWr9OTLrflizfItcZuy7NX4Y53
	jPMqypWlE7DsU1GDegKoFvRYpkzKaQMbiC+FLnliKsiuhcfLxBipsnQWRUIoMjd8aUkEMXM8BS8
	3Hyed/7iTlPHGtuJSV65KD7L56R77x9gaiZOwPg8WHIMvK7vMcRne49AZAYxczzT9xu93FHOWFf
	5S3mxxMAEzsfi8hNrD7bGFyxJLkX1OlbPSZSmS2H7yZ6dnPMjKj2vUk/4/ckJ/PnBg/w==
X-Received: by 2002:a17:90b:164b:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-3966cdf6813mr25481388a91.0.1787822595919;
        Thu, 27 Aug 2026 02:23:15 -0700 (PDT)
Received: from Default ([2409:40f4:1015:7531:12c9:ad3b:96d3:4379])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905c18bsm16037789c88.14.2026.08.27.02.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 02:23:15 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: KASAN: slab-use-after-free Read in roccat_open
Date: Thu, 27 Aug 2026 14:53:01 +0530
Message-ID: <20260827092301.19883-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6a8fd9c8.50659fcc.60cd.000e.GAE@google.com>
References: <6a8fd9c8.50659fcc.60cd.000e.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: upstream 903c1cf6dff9

diff --git a/drivers/hid/hid-roccat.c b/drivers/hid/hid-roccat.c
index 4f15eb951039..505844890ed3 100644
--- a/drivers/hid/hid-roccat.c
+++ b/drivers/hid/hid-roccat.c
@@ -236,6 +236,7 @@ static int roccat_release(struct inode *inode, struct file *file)
                        hid_hw_close(device->hid);
                } else {
                        roccat_free_device(device);
+                       devices[minor] = NULL;
                }
        }
diff --git a/drivers/hid/hid-roccat.c b/drivers/hid/hid-roccat.c
index 505844890ed3..220666bdd13d 100644
--- a/drivers/hid/hid-roccat.c
+++ b/drivers/hid/hid-roccat.c
@@ -370,8 +370,11 @@ void roccat_disconnect(int minor)
 
        mutex_lock(&devices_lock);
        device = devices[minor];
+       if (!device) {
+               mutex_unlock(&devices_lock);
+               return;
+       }
        mutex_unlock(&devices_lock);
-
        device->exist = 0; /* TODO exist maybe not needed */
 
        device_destroy(device->dev->class, MKDEV(roccat_major, minor));
