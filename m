Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792799684;
	b=2HgORKLIbbpemxjfhLV0/KfWPaL/YzKG+ldi8bx/S6bM3rl1vwyqwzZjYcDQOVov9ESe
	 qBZsd7QM3N7gVA+xmDMwpegAgQ5tLlbyvqHN2BkuQ+ivGey7o30YJdB6PmqrT0+2cqTOw
	 1JikYn/4kMutEqY+mmU0rXaglm/0N8ghvGyyD6H9XAkyL/9WKrWbyLY98bmYZNO+VTBvt
	 wlKLC2U/wq9/C0mQNwSl97XWPgifsA8xIVy7pzcxS3dbGlQ4eW5SkjxHMysuMIAuP0d8E
	 tT7EHitfNwwo4XYysEOR0iJ2OV1uH3cywIDN0MnniKq/nSe9YemDjKzecIrKJE/oypg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792799684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WO1k3TgV0Bh76n9QH9sErT/UKtvZr0Io2i7uE9+6nI8=;
	b=eserrkCdXM6Pck3kpSMppqVe9LiIOVS5f2hiAZ2YIwM3dK6UlhrGwH1ZCu0BlQHs2HUn
	 PdxrPiKUOuzOwC5yCOAzMzjhgaQTC0j30EiaNx/v5csl/AFpyTuyY5piOm7PP5X016LHm
	 Yun1YqbMmxFCqE28yACGr6CObgO60gnY6pjtfpJrE9dZDADN6r8B9JRzdET+h//FF0ttX
	 Hl/GQ6lzzH1iPHoUAGxuceNKG8B3L2KfKStlw7Lx2PXiONDKctC6MIT7kwfpa8Q5w5VPF
	 aqJZDDaXnBx6xTfDHzYzttyX+f7saYIm1SjnGzCEhKUA0OC+SSbxka0FX/Zqiq8cFPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F3Z7ASAC;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE8B606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEE8B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F3Z7ASAC
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35b2c599f43so3187083eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792799683; x=1793404483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WO1k3TgV0Bh76n9QH9sErT/UKtvZr0Io2i7uE9+6nI8=;
        b=F3Z7ASACUGhMy6ADDKXvY93UU9xIRwjIyXSNIzj/jOUyXTLuBrRcyVtSmiy5nGGaBV
         jUSivCDtXUMGwYFOyN35e3l/Af8C8NYu9qU9sfbO7W3O6sUS6o2FgDXua4xXSivEvKhe
         uo8T4Z3/UMZkWr+M1RQvjGMzha1nYhKSlHZhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792799683; x=1793404483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WO1k3TgV0Bh76n9QH9sErT/UKtvZr0Io2i7uE9+6nI8=;
        b=wZFK4tMHspHDxMiHZgyFQMLF9gpauTtt1rN7hHOgU/w9xO03bPZHTzH7w3PpX9lwcx
         5yv9vf2Otdsd0NJN2TdBDbFgRg4FIAYZGZW8ANX65QVMu+s8hVUSEtrblyyqykC3fB37
         cFFsVvGYR88iBJaK8CBBsP4YwQ68O3o19a03zL2LTny3uuaW1osHE4ZlbqxMubF5JgsE
         ftE+5Kv3wHtg6u5r23bL4a1xri2/sU6n21fZz4ni4OSneWM4N6BwEj+RljhlRfoESV7c
         3GOuM1zTSrz5D3lApuHvQhFLhGvnlpvzpzwdSbPXoHuVMZOqp68ksgCIYEoYZYJ6aDbn
         IWhw==
X-Forwarded-Encrypted: i=1; AKwUvBwfRddwarv9kegyYZE5ewThiTjpPKmTo4fOWx/jRSLRjISD9qgGEEzzeaOGe+eZ00N45qkaJQDn2lxKSiE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK55VHRFqtplZBf7zTgoNXwkua7cZymND9yr8S9YO5YUywHD+FS
	a66E3E0fciRZt8KrbGO7PBrrv92Snc08UAYfPKbxP7cpMimCm4V8qwJQIniRn5qqgZdon11oYgy
	D19xmhQ==
X-Gm-Gg: AYBFou1kasMdpxNnn6h2H6LdS23PPy8fT48VnpOU0sWpzYRPiz6AArgwCHEQkvKEEsG
	6VSxpvQwVlrN+Bv1cy3+8BgtAgGS7K055U7xzUCh1TJ7GhC5HN5n9lHM6rKUdH/irTN0p1cL8y4
	0aJ9lrQNEOvwjozPJg/RVHauDAIwWX0Tqs4m+GcEFYLVP/63oTqlq6ea6zZWXwsMgL+wVG+owUI
	XyiIu/rqxdVGFbUY3l1DE5+WZjrz/PuKX4a/pO+8e2UybkbQmCzZRhPJzumGgiuTW5hq7hIDGM6
	OK6xWr7hQVUhNsbQGCmY2uWbBpkoZUlvZ89L4LdpMwk2dASwKIQZkrkdGM7rnItC1+NBXyg4jT+
	rcDPmry+PV3kdB3wmfHatiX4T1OJERHWonetCcP77fOgOMrK7ZHxgB45TjBhjEm83JN87b7l2Ak
	piyK/MEu+vHVF1c5QDq+A4oxK1LrubkESaYWNTwM1eV+9ZolttC5n5qyDS8d5NA1EoRn9uw2TKr
	ROPRj5twmXuR4eXz1pV8PF/ZjuZSAGyCbm2B2vora2hbpbPeX38Dvy7NUYFKg8/942AsUxx5yXj
	BHTgCG1ze7CT2h4h/WYleQgsBOnWUBR3BGgRaEIfKA==
X-Received: by 2002:a05:693c:8814:10b0:361:7ab9:479d with SMTP id 5a478bee46e88-369e84a69bcmr1121351eec.27.1792799682676;
        Fri, 23 Oct 2026 16:54:42 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:f8c2:b3aa:f878:2faa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm1460608eec.18.2026.10.23.16.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:54:40 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joonwon Kang <joonwonkang@google.com>,
	Subhash Jadavani <sjadavani@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Lucas Wei <lucaswei@google.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] mailbox: Find a matching mailbox by fwnode rather than device
Date: Fri, 23 Oct 2026 16:52:19 -0700
Message-ID: <20261023165211.v2.2.I23f9ba38d31789f37c02843132172236b96caa6c@changeid>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
In-Reply-To: <20261023235408.3063350-1-dianders@chromium.org>
References: <20261023235408.3063350-1-dianders@chromium.org>
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

Sometimes, instead of registering one mailbox with a number of
channels, it makes for a cleaner design to register more than one
mailbox. To make it concrete, you might want a device to look like
this when represented in device tree:

  mailbox@abc {
    compatible = "my,mailbox";
    reg = <abc ...>;

    north_mailbox: mailbox-north {
      #mbox-cells = <0>;
    };
    south_mailbox: mailbox-south {
      #mbox-cells = <0>;
    };
  }

  mailbox-client@xyz {
    compatible = "my,mailbox-client";
    reg = <xyz ...>;
    mboxes = <&north_mailbox>;
  };

You might want a design like the above for a few reasons, including
(but not limited to):
* There may not be an obvious numbering of mailboxes. In the above
  example, it's not clear which of the "north" or "south" mailbox
  should be ID 0 vs ID 1. While an arbitrary mapping could be created,
  it's cleaner not to introduce an arbitrary mapping.
* A single device could have mailboxes with very different properties
  from each other. A mailbox with "channels" implies that all the
  channels are fairly homogeneous. A design with sub-nodes and no
  "channels" allows each sub-node to be independent.

At the moment a device tree design like the above doesn't work
because, when searching the mailbox list in mbox_request_channel() we
check against the main `fwnode` of a device.

Extend the mailbox interface to allow a `mbox_controller` to specify a
`fwnode` to use. If this `fwnode` is NULL then keep using the `fwnode`
from the `mbox_controller`'s `struct device` so that existing code
will keep working with no changes.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/mailbox/mailbox.c          | 8 +++++++-
 include/linux/mailbox_controller.h | 4 ++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 6c9d426f4e58..692087d461a5 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -463,7 +463,7 @@ struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 	scoped_guard(mutex, &con_mutex) {
 		chan = ERR_PTR(-EPROBE_DEFER);
 		list_for_each_entry(mbox, &mbox_cons, node) {
-			if (device_match_fwnode(mbox->dev, fwspec.fwnode)) {
+			if (mbox->fwnode == fwspec.fwnode) {
 				if (mbox->fw_xlate) {
 					chan = mbox->fw_xlate(mbox, &fwspec);
 					if (!IS_ERR(chan))
@@ -580,6 +580,10 @@ int mbox_controller_register(struct mbox_controller *mbox)
 	if (!mbox->fw_xlate && !mbox->of_xlate)
 		mbox->fw_xlate = fw_mbox_index_xlate;
 
+	if (!mbox->fwnode)
+		mbox->fwnode = dev_fwnode(mbox->dev);
+	mbox->fwnode = fwnode_handle_get(mbox->fwnode);
+
 	scoped_guard(mutex, &con_mutex)
 		list_add_tail(&mbox->node, &mbox_cons);
 
@@ -607,6 +611,8 @@ void mbox_controller_unregister(struct mbox_controller *mbox)
 		if (mbox->txdone_poll)
 			hrtimer_cancel(&mbox->poll_hrt);
 	}
+
+	fwnode_handle_put(mbox->fwnode);
 }
 EXPORT_SYMBOL_GPL(mbox_controller_unregister);
 
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 26a238a6f941..591ccce3de3a 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -63,6 +63,9 @@ struct mbox_chan_ops {
 /**
  * struct mbox_controller - Controller of a class of communication channels
  * @dev:		Device backing this controller. Required.
+ * @fwnode:		Firmware node related to this controller. If NULL
+ *			the firmware node of `dev` will be used. Register
+ *			will grab a refcount and unregister will drop it.
  * @ops:		Operators that work on each communication chan. Required.
  * @chans:		Array of channels. Required.
  * @num_chans:		Number of channels in the 'chans' array. Required.
@@ -83,6 +86,7 @@ struct mbox_chan_ops {
  */
 struct mbox_controller {
 	struct device *dev;
+	struct fwnode_handle *fwnode;
 	const struct mbox_chan_ops *ops;
 	struct mbox_chan *chans;
 	int num_chans;
-- 
2.56.0.257.gf7497c7d27-goog

