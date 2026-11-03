Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698105;
	b=YUP6qBd7xvZS5NyxicgMJ6dV+To5axU0DANiYlImc31U9jN5MKJyXu296Kc6wYYIUbPN
	 m2ZYXqDFVNmekkjOGpF8VF+fWmTNQL6nY4k/jAqXVbUds5j0GMGrA/cDcI5LeRzXbfnmW
	 JUnJmRjBBD95HHNyRw/dj1GegLsq684+pW+eJPr8kSA4ZN8FQVk4f20FQDIPXz02CDjyJ
	 cfZ7SGOgmaozrRJXwSYh+qoBrmiQKMTcWUK4+ftLqffi7Y4hy3cTJkNG5VcX/zxIFmBvr
	 IbXYIf+LM8QV/i6bGereRyhqZ56uIaXSpsDc/E09pZOeFZRbofHSa5afFjwGSAaSKiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rJxzKiW1QrwhdtV25TvjUmW0XRnbnGbKhj6Wgjpusvk=;
	b=0HASLiuPRTTpexYehm9kUvsK7g/hN3aUM/Fg7izXFNRQXVeG7FQ5URVX7Nr42ycHGFLY
	 QR6QHhcJMwwS1koGM52S4S9m31ujLK+hrqnQstict0yL8mgOK/YSqkWPaENxSy4wQ1pBF
	 aYnO5OWZ2dsIxmWmb7i+tuOLVpSnx/btiW9x86E2thkRQWj7lu/35yKvcO2IQzzh6fJ//
	 xLPnAZFGpzP46jDD57g9T0O9gYnYTeH7iNrJOig6AfUc7zM80kOBerr5HCVTyE3IE7Xh7
	 N2ksF/PxbNERmwhLHU0QDPqutBaZ3u2Ti9xT1ylB43gs4aoiGJO6cFLCigseB3WdhPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gCArxcZq;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D747606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D747606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gCArxcZq
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so30238805e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793698104; x=1794302904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rJxzKiW1QrwhdtV25TvjUmW0XRnbnGbKhj6Wgjpusvk=;
        b=gCArxcZq2qPvEVRAGLYosQd68W9qB8Rm2ou9zpAVj7wojSx+qJgf6cqA6Buze2EXbI
         deIy+ZleS+CUyqT4dLU2PjX2ltoKVpyP/8EVZib9kGGW6rhoVKJ8BCH/AlBPe96Uk9RV
         D6cDBkqtlPMa08AJXRQ8sl+uHP2Jyz/2pgY21nJzXsJKARzsTMgWFtvCapi6bBY2ZG9R
         JWsWVxJl8wTTjGA8b6sCATfwXHuInfoCeA6wAU2Tt8h1uJJeaeFtYdWSr6OhAce3pDPj
         J8c7US5tacb8EYYIugkHEJ6HDHCjRxl0iO9QaakK2nA+MMGnx3UdhlwiUH5sEOXp7xiH
         mAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698104; x=1794302904;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJxzKiW1QrwhdtV25TvjUmW0XRnbnGbKhj6Wgjpusvk=;
        b=bxK890qcJY3w5mAMq5sVsfyhw2lTYNFMH1LVIEgGBaT0zeQnmBFdBX0iEaThUqZkU4
         hQ4sh/iba5DrIS7S3YE21xJ0YpVVcxwkovCjX2PO52Ov6jwVm7Hlkgaehugk+W2+fmui
         jP5cFFQh9gby03/jM8v13pGE9kzb9uYqErKfMLNltHSsaayHtnG2SVWHT7ZMCpF8+dy4
         vyIix+C6Na1PwSwAZTtvcKFiAquAAeOoWZn2Naj17GP3UAv7KpCjv3IWfUCd9R2jbwYj
         O1UBL2KMglOfOzbyyFBc/z8eJ4H1w2bpuYYaQ2OFTsgo1NxdZVaa32rVIFOCpyDKJyDT
         JA4g==
X-Forwarded-Encrypted: i=1; AKwUvBwB2gF8xWOTWtPwplpfvR2Xkklop+X8G2r8T2zJopX7EOV1JKBI2nr8o5PbT8z3UDyiksc2jzXWxEGrZXA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NdQgLpiVfzKMyphgpA/b8wavupgFKmV8MbEudHNaWBKNK0lGi
	yS3eq8II6fkd3AmyZiJ3Yeo/Wc9ZqRRmnpxqX/3l74NgkIh3waG4IBQA6iVGPoNO2pZ3gExu
X-Gm-Gg: AYBFou2sRjzwsr0vORx8kyG6ydFkStIf/cBvamGJHyOvfL5LQxeLLPsAvA+Hgepg8yW
	JHaAcZivTAyRIgOUoFdzV82Va8f5rI6U0OLkTBCAv8CPCuyRjDPGKE89FG+WXQdqPzJ6hz+LbFJ
	vWAFbEWkMpdFMb6II+DG7/878jx0joraP7INp4fNmmSHfZrcLXxBquO8Fz4y77S1+jhgfjlJelC
	2KP63wZYnlsxzorA6Ti8FLFD2Grnw+fkvb7lJegSsYQBrPusiImylhneT5ls6O5HjssuocBL+9b
	YkGk7xR7FFIvi9n8r7eHFC7tLIZPwa5jenMg3rT9tQ4IXPi2TsCrEvc5kSTiNNFgXxchkanYCrb
	DyXukd3KH9WDLT5m/okgcdI1Q7PJnPmZIOiPRZo+wt260HNCCoO+2CChGElVBZub1J2G+0I/v5k
	FH4AGFTnK1loJXiuxxzMeSQ3YXgqoljXDX+b/uPReCZwv+y3pLH70Y7vOV14lFs1lsD6ElYDkfY
	6ogCCkDnZs5VuWYQDN+7Qpt4g6sDjiBU/jVSW+8zuzbh67KbHepa9ilLuuXhtovzc8BbCJL/kZo
	ss+KFj+Yohozz4P3DGv0VJCHOCtWw07AgTEEIev9TcTdF4qjhj2swhko0wAru+dHqBVwJueEie8
	9iHjf/rhX7/yVYftwaUPFieBK8VaMw1G8LtzoxwME0gRGKvnydroXLw7/m6GbMIH78g==
X-Received: by 2002:a05:600d:82f2:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4afc2105bf0mr185589865e9.24.1793698103693;
        Tue, 03 Nov 2026 01:28:23 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a922c298sm38522655e9.9.2026.11.03.01.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:28:23 -0800 (PST)
Date: Tue, 3 Nov 2026 12:28:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@ieee.org>, Maritu Hone <marehone12@gmail.com>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bryan O'Donoghue <bod@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: uart: fix heap buffer overflow in
 gb_tty->buffer
Message-ID: <aumpM9Hlh40t9UZd@stanley.mountain>
References: <20261102195332.19860-1-marehone12@gmail.com>
 <f3848ac6-a105-4581-8f17-fc9d3f748b74@ieee.org>
 <aumfB5MLWIQuTYY3@stanley.mountain>
 <aumlkgtsSDS1fw4g@hovoldconsulting.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aumlkgtsSDS1fw4g@hovoldconsulting.com>

On Tue, Nov 03, 2026 at 10:12:50AM +0100, Johan Hovold wrote:
> On Tue, Nov 03, 2026 at 11:44:55AM +0300, Dan Carpenter wrote:
> > On Mon, Nov 02, 2026 at 03:33:58PM -0600, Alex Elder wrote:
> > > On 11/2/26 1:53 PM, Maritu Hone wrote:
> > > > gb_tty->buffer is allocated once in gb_uart_probe() and reused for
> > > > every outgoing chunk as the backing store for a
> > > > struct gb_uart_send_data_request:
> > > > 
> > > > 	struct gb_uart_send_data_request {
> > > > 		__le16	size;
> > > > 		__u8	data[];
> > > > 	} __packed;
> > > > 
> > > > In gb_uart_tx_write_work():
> > > > 
> > > > 	request = gb_tty->buffer;
> > > > 	...
> > > > 	send_size = gb_tty->buffer_payload_max;
> > > > 	if (send_size > gb_tty->credits)
> > > > 		send_size = gb_tty->credits;
> > > > 	send_size = kfifo_out_peek(&gb_tty->write_fifo,
> > > > 				   &request->data[0], send_size);
> 
> > Wow..  Heh...  I have read both the original message and your
> > message and I still have no idea which function contains the
> > actual memcpy() overflow.  :P
> 
> It's the kfifo_out_peek() in gb_uart_tx_write_work() that may write 2
> bytes beyond gb_tty->buffer (as its size is currently just
> gb_tty->buffer_payload_max).

Ah, right.

The right way to fix this is to have a commit message that
says.  "The gb_tty->buffer pointer is supposed to hold a struct with
a flex array at the end, but gb_uart_probe() only allocates enough
space for the flex array so it's two bytes too small.

Part of the reason for this bug is because it uses a void pointer
instead of a struct pointer.  Clean that up as well to prevent
future bugs."

Please send something like this in v2.  (Send exactly this code
but edit the commit message if you want or leave it as-is).

regards,
dan carpenter

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index e1b73db6a17c..7d1985d63482 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -43,7 +43,7 @@
 struct gb_tty {
 	struct gbphy_device *gbphy_dev;
 	struct tty_port port;
-	void *buffer;
+	struct gb_uart_send_data_request *request;
 	size_t buffer_payload_max;
 	struct gb_connection *connection;
 	u16 cport_id;
@@ -230,7 +230,7 @@ static void  gb_uart_tx_write_work(struct work_struct *work)
 	int ret;
 
 	gb_tty = container_of(work, struct gb_tty, tx_work);
-	request = gb_tty->buffer;
+	request = gb_tty->request;
 
 	while (1) {
 		if (gb_tty->close_pending)
@@ -775,7 +775,7 @@ static void gb_tty_port_destruct(struct tty_port *port)
 	if (gb_tty->minor != GB_NUM_MINORS)
 		release_minor(gb_tty);
 	kfifo_free(&gb_tty->write_fifo);
-	kfree(gb_tty->buffer);
+	kfree(gb_tty->request);
 	kfree(gb_tty);
 }
 
@@ -842,8 +842,9 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
 	gb_tty->buffer_payload_max = max_payload -
 			sizeof(struct gb_uart_send_data_request);
 
-	gb_tty->buffer = kzalloc(gb_tty->buffer_payload_max, GFP_KERNEL);
-	if (!gb_tty->buffer) {
+	gb_tty->request = kzalloc_flex(*gb_tty->request, data,
+				       gb_tty->buffer_payload_max);
+	if (!gb_tty->request) {
 		retval = -ENOMEM;
 		goto exit_put_port;
 	}
