Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794284016;
	b=xilLYG19RJLooDCwC+dOpBUDwFM0MaxUEzE0r3MjRmex1XYQB+HtpKgeapzV/B6CNT9V
	 cP9tiFGOaghn6QMxTjPbVoPQZOV8INiekvGebbDK0+VBBv6tvTvN7YZ//WkdXPwTdXdRg
	 2IrjwwAiGxzOrLlmoUa6bFZuGWYhFdKSkvamKfhyDik4bLXRHy/P8uAEv9qye6BUMC+Ho
	 7ZdG4aTauQTE5gN9OZ35HB7GOiIoHgyknI5pOoAU6ktP6S8ZOjjVM3MVVAnH1oszbue39
	 6awk50sMA+WEN6+gbZ2pxBys7EEfx9Qe44yQY3Fa7h1MHrgSW+dQIVHMWpM3YyrOBvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284016;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RtUJF0WyopFhomZoiX6jiXFAUU1AJHhZuXdWDAOOOUQ=;
	b=KTwTK+U/N+T39sF2eiE5po+DzxCGtXnBkn/9EBVQHP1Zbhh9KDSm1M36r4nUS2IDdd61
	 gww4jKaO+756uo2QNNNYen7fYc6T/KTHT0hVNKL7CWHjKodc/onNRpLYKvXfhOyEn+fwa
	 6IokH6oiiUCOgT927dfaXQdbZQXELZPAxgeRYYsotABZEIFqNbQDsc1a5pyCyk+cPBS09
	 jMw8gL0eZTfgFlYmU6JWrlyCojWVfqataD+mtGDcHbCurYusaRCbgmeLFs5M0Eum36jIT
	 huT3Ew6miDsK7qcVFrYVoyC1EMEebhAqVY94xHLVF9WPehyOFUD2RgEaTLDZZjady8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nohln9l6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C32D606A32E;
	Tue, 10 Nov 2026 04:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nohln9l6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794284006;
	b=zqH+ZIeZitu5CpgJJQgtG6qmKaVVsxBIQl3VPmZmk5O53vwnCknwPHXMIg/6cqvoc1yV
	 Zrb5fvYhgkhBjJqyuZwjLJXbn6Vyr0pZO+KSyNy89xEHvcGAzXADn4x5w0vH0FcB2/z5k
	 AhRX25jta8odKai9IDWlcffumhKZJcuHbBFQued4c7xsiBTQvEgn3sIxLVljFJNAB8LSZ
	 qovhxUfIiXrR70cAdSiwTyTXegolNkcL13vcSjvmajRBvDo4/PCeDQhZOa5qT8cAjZaBl
	 rvsie9jS5TKYZqhcC1v4QO9llPtE5uOBdJ6yn4pynF2h61w8nj2c0AOpz/gDYHOw3/w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794284006;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RtUJF0WyopFhomZoiX6jiXFAUU1AJHhZuXdWDAOOOUQ=;
	b=tbVePIgBVLAo6RKYXZ9HbUG6MQkcDs1/CEdqssAAJc1KrZ33mM5LDW5LLSCDQfAPp8ff
	 qVcTOSgyclduq0a3+0ZNSGvgzGLooOMKjxz9DqeTogb+pi+FQE54SY9kz4pwGQK54+izh
	 mhGRJXxxhtwasysHq1U1D0xxy0mvsX/9MSgeGMdvRPC4Vits5f/F542le8IwH4uAqSyL7
	 mwsiTXXwj+dxIJCaZ+fzzWV1hg/0yvz0XfHLyDrgd5yX2LxTENkHNxopq13G3Yj5PI1ZU
	 jW0Gexwf7nIzGPY535eG+QmJJ73vmgqnm9q8sq0ua1Kcpsyb0boTN6Zj8SvMp02IwLA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 253691F008A5;
	Tue, 10 Nov 2026 04:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794284006;
	bh=RtUJF0WyopFhomZoiX6jiXFAUU1AJHhZuXdWDAOOOUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Nohln9l6JT86Gp+XzMmO7zn5XWaqo/eAgj6GShLYgBpYBCVFXM++b7doogflCHSE/
	 S2YZ9dp4a1sVgfojCG8iCqjHfZb/P8CiZ4dvqjcI6rCKp6kh+GO6A4B035279uJHfy
	 PTbwmDBapzCF4DqRKxvxB7U7xW3oXy10APZQJ9l1/Z7lYZ38GYH1jBCzQlenxdG87y
	 BmlCSEsZ4Z+311YjNMYMU6Q1KODB9kPk97NcvalHFsOq+HafhKLVo9jLoLQc0MZiLV
	 VSPtZs1OG7gqyUy69WRWPVWRAvlzBKj8e+rdHed0saDyfFZO+rD7ifJhXnAXDgXtTC
	 gqENYDIuEe3/g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A550548835;
	Tue, 10 Nov 2026 04:13:24 +0000 (UTC)
From: Jing Lin via B4 Relay <devnull+kayano050408.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 12:13:25 +0800
Subject: [PATCH v8 4/4] usb: gadget: gadgetfs: avoid writing through the
 const setup pointer
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
Message-Id: <20261110-gadgetfs-ep0-v8-v8-4-8f90434574fe@gmail.com>
References: <20261110-gadgetfs-ep0-v8-v8-0-8f90434574fe@gmail.com>
In-Reply-To: <20261110-gadgetfs-ep0-v8-v8-0-8f90434574fe@gmail.com>
To: Neill Kapron <nkapron@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jing Lin <kayano050408@gmail.com>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794284002; l=1652;
 i=kayano050408@gmail.com; s=default; h=from:subject:message-id;
 bh=si1G1+f7e2FG0Kdc6yaUjRpBdhJGWuq2tBRVF9N7SWs=;
 b=4X2b14KJGYKqkiqdu1sgSPXlx+ejPt1MvYgZojmzkj8+bKmetmZyJvGRKuWPwo9/t34QG+Djr
 gEv13KDn/IgA92rZ+4fThWONhvQFYcja0z3yRk8HU1MroZ96sovS6ty
X-Developer-Key: i=kayano050408@gmail.com; a=ed25519;
 pk=pr6i8RN1WEON1jbXPdghSglxaBSzfuJjXNGFknX//+A=
X-Endpoint-Received: by B4 Relay for kayano050408@gmail.com/default with
 auth_id=1441
X-Original-From: Jing Lin <kayano050408@gmail.com>
Reply-To: kayano050408@gmail.com
Content-Transfer-Encoding: 7bit

From: Jing Lin <kayano050408@gmail.com>

gadgetfs_setup() receives the setup packet as const, but clamps an
oversized control IN request by casting away the constness and writing
the truncated length back into the caller's wLength field.

The setup() callback has no business modifying the setup packet, and
ctrl->wLength is only used afterwards when initializing event->u.setup.
Store the clamped w_length into event->u.setup.wLength directly instead.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Jing Lin <kayano050408@gmail.com>
---
 drivers/usb/gadget/legacy/inode.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index d15739df2..12f04329b 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -1616,10 +1616,6 @@ gadgetfs_setup (struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 
 	if (w_length > RBUF_SIZE) {
 		if (ctrl->bRequestType & USB_DIR_IN) {
-			/* Cast away the const, we are going to overwrite on purpose. */
-			__le16 *temp = (__le16 *)&ctrl->wLength;
-
-			*temp = cpu_to_le16(RBUF_SIZE);
 			w_length = RBUF_SIZE;
 		} else {
 			spin_unlock(&dev->lock);
@@ -1777,6 +1773,8 @@ gadgetfs_setup (struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 			/* state changes when reader collects event */
 			event = next_event (dev, GADGETFS_SETUP);
 			event->u.setup = *ctrl;
+			/* Report the length we can actually handle */
+			event->u.setup.wLength = cpu_to_le16(w_length);
 			ep0_readable (dev);
 			spin_unlock (&dev->lock);
 			/*

-- 
Git-155)


