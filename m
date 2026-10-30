Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793328017;
	b=v5HCgygsbCq+IP2Ab8/o7C0nX1LxerKLj6b0ecFI9uEFVrH3S7+9SSlDFL33nFJqJ/vh
	 NdpDF1QxBGdRtAEvJB+OUejUMF7ZvKVvj9Dm8TFLQ+sQohoSISh0eJuUQ8f0Ij8FjU07I
	 LtrDcDgndw2+s81rkBBbK5SV0gNyKhr8j2GezuR8Lm5FWWHhz1UOhzfD74toD5/pI9eSd
	 oqAYb4W7YKr7Sl8Zle46sEHTFb7PlWJSYr7pUI4CkCpJZTLXj6NgY1tyTNb5NLY4EuBgp
	 k0utcuLmQj1+UDfIsX8SdcHfi9J9NqEbh8UkgrfiyVJFdHWk9uLFIvvAM0YK9MiGpXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793328017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=+ELhbW/6uxFSOtLiXrpEjFCc5Al5bqntgfPHZO1Nwwg=;
	b=neWcaEm3c6rj/7g4jHsiOx4UyC7zp57CjrP3//8NJO2Px7iaqHk2axpzE3cZL2VePT6G
	 JnIfemFpQVJj6qkSMi714Sb5coHHKuq8WtGhtUApivhwQcfD0f7xxr6KvMAxFhnZ/Vecg
	 B21zDl8zyJISHpFPXG6y/Wx/X+XOJLFeEcxWRL1TMp3Mo3akJZmRXnz7HTKQHi3vECN6P
	 cHyLAbWnNvUR8m+cyULpqdaAz/OA1mJQV0KdzkXLW11SgRWBfHs2xz9p7D1l883iblsss
	 4ZQ0CC5WvVoqSQTiYAp38MYadZbo3Ft6ziCUoTwD2ie8hDZ6V1A4oTwc258KoiKga9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vAisCruQ;
	arc=none smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC3A606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FC3A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vAisCruQ
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so257081e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793328016; x=1793932816; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ELhbW/6uxFSOtLiXrpEjFCc5Al5bqntgfPHZO1Nwwg=;
        b=vAisCruQ8cBFET8/dNwfmyX4n77Anbj6EdSlbqajFzCnS4ibrEtl1nvb9B4yOA8Pgb
         y6qBY5tyTutbrINbP9qrKQnGBuoysT5emmza9W8WrZRuTbWGaEuNoEq1LfXZe+zl2omN
         oz1xP+KvELhetEI+CFCf/RSa2SHk35YqiIwHoWJF4HMVzh/fBjcwc4hBs8KoDLld8Efv
         kEh7pG9RvwS2tst/SqVyjwRq92JVGJQqGzfJ3aGUDY32N+hkW9LEqdupYbtyT67gc5fo
         Z2JWMIkV9aK90ZiO7ouT4iWD1AnLaIMzsaeGPoqLzug9mHJkSWq3xjliW0k+OO44zekS
         EGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793328016; x=1793932816;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ELhbW/6uxFSOtLiXrpEjFCc5Al5bqntgfPHZO1Nwwg=;
        b=gfTsBrn+Al+kSSMoUvjogyv/vNLp5ZB39dwbYmP4epPCWWauFSOBipIOjGHRUW4/PU
         HfBJ6OfqeBYuZIrnQLpJX/xueA2ap3T4g3+lef/oi4Zdh9f0+KACis9fEjAUCeIh1rIO
         l4OAov5AyLtG2KSM/yNt50MqbiMcQh5yFSMYIdPLPBzFp086ubaeG3PDQfU87Essfujj
         ecaAFlCI9b7APQwTFZ9O73vRHzDPWFa7xznd2SOjbL+9KHUA1i4u41OBT/xeSYExi30z
         Ui5aLNAGxW2as/K/dRDGWvNWL1K6Uao4RWshnSWZS+i2OgwuOFAlQh7NMBiu1m17GMcv
         Si1g==
X-Forwarded-Encrypted: i=1; AKwUvBzGgc+NNSt4Nb/7qYkh3WY2cmU7tOUEhO3AMTvxIsD3pFXZy6/RY10DKIjiAfVZhgbqF3o/XkkJMdEZZzc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBTZDbY8zsrFW1fbPLQmv3l0TNrX2tzxUlzjZzVZFy82VeJBdt
	HvVEKCADThKFCE1UvfeObSHff69vsc0JqGv4ce148ehMsv9GHiD+2GyO
X-Gm-Gg: AYBFou3Kx0fa8IIVLk+Kfg7RFCMiXCmUH7XOHgboE1szCEWx5505iSmdVZZmKnw9M6Q
	nH+9G1GXUosbjNBsLzOobyHGfA7CLkrywefZT/9k4HS+gY/9iZnBjFRNuEBPwUiH0HqC9PnYCrn
	5/tjHTYVfZUa4/NtO46UdpeTNYNSCF/rHAv8ZBFIMfEPFUp5JBOPIqgz5LPl6bu6FaIU8vwPobU
	894bGyQAz9CafxqAfAHD+K+fsnKcm+rdeIkJAeAAZXE9tIjT8CbMf6ff2/GwtpnWgdL9xsny0OG
	9UkG/Rx9x+VbvTAk7/aBs7v7kMqTuqmolhvK01uneXJWUOOGnbL3pW8iQvc3EhIcaWMxwKnrn/c
	JMgQEukxaNgAqR9lSXTE1LKbIZfmXZObXy5PjF6yLnwsiyHLFnkPODQhbN+cenoIg3Z99RJnPaV
	Zs3x2dAUupDZXwULenOrXwjxey5WNhqBU2CzdWmM81iPOBZ5s8TVus6hOUYvwa/rTkXQllF8UYY
	8nGRhvoUU548sTAG5XYDo7aEXuadXD+ny+HakWiHmyOyVLQprvL8WfXVcHTA/6GmW8QHRscM9VK
	IT98zYk8UKZRrXXS26AbHleQ7vVNceeeZ5cIHkEK7Fzs4XchQzswjB96mqo0ogjoLAidRVtt6gH
	2ZvIRPlH6IGhjjmgzOhv8/775AqAf
X-Received: by 2002:a05:6122:ec5:b0:5ea:dc36:245b with SMTP id 71dfb90a1353d-5ec6896de21mr562647e0c.18.1793328016018;
        Thu, 29 Oct 2026 19:40:16 -0700 (PDT)
Received: from macbook-pro-de-joas.local ([2804:7f0:b101:c5e8:ccdf:2b09:f69e:4902])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69c5d183sm963735e0c.13.2026.10.29.19.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 19:40:15 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net] nfc: s3fwrn5: validate the firmware image size against
 the firmware file
Date: Thu, 29 Oct 2026 23:40:02 -0300
Message-ID: <179332800288.52644.4206885352837613064@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

s3fwrn5_fw_download() hashes and flashes sector_size * image_sectors
bytes starting at fw->image.  sector_size comes from the GET_BOOTINFO
response of the controller's bootloader and image_sectors and the image
offset come from the firmware file, and none of them is checked against
the size of the file.  s3fwrn5_fw_update_sector() also always sends
16 * 256 bytes from the start of each sector.

The controller decides whether the update runs at all: it reports the
version that s3fwrn5_fw_check_version() compares against in
CORE_INIT_RSP.  So on every device up, as long as the firmware file is
installed, a controller that reports a
large sector_size makes sha1() and the update loop read far past the
end of the firmware buffer, and one that reports a small sector_size
gets up to 4 KiB past the end of the image sent to it in
UPDATE_SECTOR data packets.

Check that everything that is hashed and sent lies within the image,
reject a zero sector_size, reject an image offset past the end of the
file, and make sure the GET_BOOTINFO response is long enough before
copying the 10 bytes of boot information out of it.

Fixes: c04c674fadeb ("nfc: s3fwrn5: Add driver for Samsung S3FWRN5 NFC Chip")
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
Tested on arm64 QEMU with KASAN, with a test-only module that registers
s3fwrn5 through s3fwrn5_probe() on a virtual phy and a userspace
emulator for the NCI and bootloader protocols.  With a 4156 byte
firmware file (one 4096 byte sector) and the controller reporting an
older version:
- sector_size 0xffff: oops in sha1_ce_transform() from
  s3fwrn5_fw_download() without the patch, update refused with it;
- sector_size 16, 2 sectors: KASAN vmalloc-out-of-bounds in
  s3fwrn5_fw_prep_msg() while building an UPDATE_SECTOR data packet
  without the patch, update refused with it;
- sector_size 4096: the update runs the same with and without it.
Not tested on hardware.

 drivers/nfc/s3fwrn5/firmware.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/firmware.c b/drivers/nfc/s3fwrn5/firmware.c
index 9145deec7..159afb8de 100644
--- a/drivers/nfc/s3fwrn5/firmware.c
+++ b/drivers/nfc/s3fwrn5/firmware.c
@@ -93,7 +93,8 @@ static int s3fwrn5_fw_get_bootinfo(struct s3fwrn5_fw_info *fw_info,
 		return ret;
 
 	hdr = (struct s3fwrn5_fw_header *) rsp->data;
-	if (hdr->code != S3FWRN5_FW_RET_SUCCESS) {
+	if (hdr->code != S3FWRN5_FW_RET_SUCCESS ||
+	    rsp->len < S3FWRN5_FW_HDR_SIZE + 10) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -307,6 +308,10 @@ int s3fwrn5_fw_request_firmware(struct s3fwrn5_fw_info *fw_info)
 	memcpy(&fw->sig_size, fw->fw->data + 0x18, 4);
 
 	memcpy(&image_off, fw->fw->data + 0x1C, 4);
+	if (image_off > fw->fw->size) {
+		release_firmware(fw->fw);
+		return -EINVAL;
+	}
 	fw->image = fw->fw->data + image_off;
 	memcpy(&fw->image_sectors, fw->fw->data + 0x20, 4);
 
@@ -409,11 +414,26 @@ int s3fwrn5_fw_download(struct s3fwrn5_fw_info *fw_info)
 {
 	struct device *dev = &fw_info->ndev->nfc_dev->dev;
 	struct s3fwrn5_fw_image *fw = &fw_info->fw;
+	size_t image_avail = fw->fw->data + fw->fw->size -
+			     (const u8 *)fw->image;
+	u64 total = (u64)fw_info->sector_size * fw->image_sectors;
 	u8 hash_data[SHA1_DIGEST_SIZE];
 	u32 image_size, off;
 	int ret;
 
-	image_size = fw_info->sector_size * fw->image_sectors;
+	/* sector_size comes from the bootloader and image_sectors from the
+	 * firmware file.  The whole image is hashed, and
+	 * s3fwrn5_fw_update_sector() sends 16 * 256 bytes from the start of
+	 * each sector, so all of that must lie within the firmware image.
+	 */
+	if (!fw_info->sector_size || total > image_avail ||
+	    (fw->image_sectors &&
+	     total - fw_info->sector_size + 16 * 256 > image_avail)) {
+		dev_err(dev, "Invalid firmware image size\n");
+		return -EINVAL;
+	}
+
+	image_size = total;
 
 	/* Compute SHA of firmware data */
 	sha1(fw->image, image_size, hash_data);
-- 
2.43.0

