Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451562;
	b=u9ubfPB4G49LB6Jdz7G7Mb9SKKmxYB7A8LdEYmotvmDKvse3Sh3QKcF0Nn8L7Axt84gM
	 98VxNeONe6bYM9O4DPj54Xc0jOz9zFkwMJAByhnY46D47y6mOf1/zLgJ6/T3z1dXOwRWb
	 OExYO/h3PRsl+i3YXWYsVp245+Qn61Ovck6TcBg5JWOFuCVzRZ6Dw9KD0CJmZHlbmjvv7
	 Hlxg5rbNl/QiyNh4TD5k5BVik8d+bTXhjednmwYM8z/jsWzbYwhZXd0jMg/5q6mPQ3xOb
	 GN+xR0Zz3buc+lAw/Ek5+uZa0Hip6YL0F316+31V7VHC6bIvramZwJo3T+X+RRgcymg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O0Wzh/H6cUYHlQzokf7YPQu3CTXbAI/owZLe5svmt0Q=;
	b=QD/IDJ7m68iF2eAJT9LSc2S26YdKUYQqjWp74A12AYZ90vQ8DwcFqH4og09mOYA08ZD+
	 04N8lQU28UceaxWp955Z/dzmTBl+hIt3XRDQyWf/JnpHuJhx66oJKVHUFlhl5Wi8p/jfm
	 gefWRf9G0h5ToycAbbQ3l76eWuhnDx4rIG0KVubRTvR2tz7R0cBiR40YSaClTFObQqf4B
	 vhyxJphA7hCew03qAJzEfp40d7Ir5xMQRv2WlTWImv1MurplhbEcz608Fea8oOQAzWE7L
	 Vgvom9gNqQbq/iW8MgkxZuoMyyxmHea7bidzbPk8ezlqT7lCOLUYLr5+VsL2Q0XMrCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wNGvUBME;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F275606A324
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F275606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wNGvUBME
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53bb57f1310so42020491cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794451561; x=1795056361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O0Wzh/H6cUYHlQzokf7YPQu3CTXbAI/owZLe5svmt0Q=;
        b=wNGvUBMElUEXZ0PAWQqCPXf2yyW7/PJf8mjwre9eMn+Y/4OWOQ1wVtFnlkK6F5M7GM
         c/cWCpaOxGsCpNAG/RSOnO+LDCZ3XtolgolHcfrhVgBQ3/6xVmxmaQuanfODhETzp0P7
         MVesNkb+ktBupi2GCC9AHsFxVHc8X6mvXOg5leHoq7SWzvLGoiYLLR0l4XWh6uiDNBbs
         vaIyNrvCDbAvjDUy7yF8wGJUuvhMIqHoAip/QIYA9DR16bJk3ONd+4dKlSxIp9dJ8j2H
         EEZAoVPloUmbpEz5ihTVvVk390+PXpBayXMoNXzAvRZ/iHZU2zqSx9p4NRTAfIwyQ+/V
         HK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794451561; x=1795056361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O0Wzh/H6cUYHlQzokf7YPQu3CTXbAI/owZLe5svmt0Q=;
        b=gNNyz/xTBEosIwdscYAbAGOtK8Hz4YqtvBTeBRZJGD4yfbx7uXvhdwDJPoA7P+56ct
         6d8WwtgD1i+c/IZdMQbwSCbjvOC3NQ4/ZhNMEh8CQZi5VYb6WXV1DAemqhZwLmSF3DRc
         Foj2QhB6TAxKtnKgWVUDtAwqU6mRq3kT5FGC9HF0hPJs7wg7SSx8q/RAgfFkJ6dznzB4
         czxM28YX4oBTURnNYR9Ce7AcEQ26dvnzuaCIFSKzXlkS9YZF4Nm5maxOe5iBQKG6hLFA
         kOQeAhxv6pM5+jLOsaQFL1VJe2xjhCdsHUwbFNYPReEJK5Etl5xWoc+CBwdENpxqfjgl
         /gQA==
X-Forwarded-Encrypted: i=1; AL+hErFx1THL7WmdgTrLe35RYTO0waRqgqZcRA28ck5bIBmtX2o7dyi1rzRWJFUu3Fn82JHxGlkV8rm+1xYf0T8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Zqx6B+43YPfOLPFo9IgnspFO+dK6y6Py04kNXjTiaMbfglSbQ
	mW1KuyXZqcH7da+3xlGpC59qyCt8tAhfnsjvmVFJugDsHUyZPU8HTDs4
X-Gm-Gg: AYBFou16M8B4K6Y8o4BwaCh+yirLBrUkcM462UxAGPZwK4WSlUNmtHn4O8QjMRTD5g8
	D87WuJficmpz+hHSURNggYiq27nBaFp07zPsFwUSt1rFzN+QsecooqvHrOFylnSlQvQB3C+ehTm
	QdQx+66VNzThM6juAPLpF4hL85VeYwybU+AU6KFW6U4FIzPp+O4kpnD9V+9pQ97ir12II+OdXGC
	5qFDEdFMNf6q34iUtLYm2E5xpv/Dhjxv4+MALXwsXdpXN/bgxw9BAQbV/k8wsY0XkbLyQr+dUO3
	uSwO39q5ZKM5ujrV7gEbC/mT+QoWoOKei0srNy8vJcjbeuOsHWXJxC4C6btBJiqNm9ccMf8KQ5Y
	1QZpbi2LghJHbpfA2e5PAhUJRMAtBsKEvGHXsHygixn5fOy1Icsqa3RWivnw/ZocmbRveVBqw9V
	M/cIGBJ1M2jqlNPv+4qYR7hApza7l7TqRnvj5buyuQPmOCJp90ObGEA+qbKI3WXNPvUly2fxUFn
	lrC1TLGmE36VEnipQkvROlrlh++Z3fuPpB/EDbNZ9066ywBaDto1p5gZyEB1PnPBke8DKf+6zc1
	N84ocXDVpoGupTpLkK+wIBivVorouMwf3lA9W/SQ4rh3lBCDroWcdBR4WrwVIEXTFaqQtDRXJA=
	=
X-Received: by 2002:a05:622a:994:b0:537:a19c:6e52 with SMTP id d75a77b69052e-556c1f42ed3mr70735681cf.56.1794451560904;
        Wed, 11 Nov 2026 18:46:00 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550af60493sm64922411cf.4.2026.11.11.18.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:45:59 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: Yuho Choi <oss.patchbox@gmail.com>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [Question] 9p/virtio: zero-copy pages after interrupted request
Date: Wed, 11 Nov 2026 21:45:50 -0500
Message-ID: <20261112024555.1201300-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hi,

I have a question about the zero-copy page lifetime in
p9_virtio_zc_request() (mainline 067c5c24cef2) and would appreciate your
view.

After virtqueue_add_sgs() and virtqueue_kick(), the function waits for the
response with io_wait_event_killable().  If a signal interrupts that wait,
it reaches err_out and calls p9_release_pages() before returning
-ERESTARTSYS.  Only after the transport returns does p9_client_zc_rpc()
send TFLUSH.

If I read this correctly, the sequence can be:

  publish the zero-copy scatterlist to the virtqueue
  interrupt the wait with a signal
  drop the user page references
  send TFLUSH
  finish or cancel the original backend request

The virtio backend still owns the original descriptor when the page
references are dropped, so it seems able to access pages that can meanwhile
be unmapped and reused.

I also checked QEMU's 9p backend (71f25c75417d).  v9fs_flush() marks
the original PDU cancelled and waits on cancel_pdu->complete.
pdu_complete() calls push_and_notify() for the original PDU before
waking that waiter, and the flush coroutine then completes RFLUSH.  A
successfully cancelled PDU is returned with a zero used length.  This
ordering suggests that the original request can remain active after
Linux has released the pages.

Is there a 9p or virtio guarantee I am missing that makes it safe to
release the pages as soon as the killable wait returns?  Or should the
pages and the transport's request reference remain alive until
req_done() consumes the original used buffer, including a zero-length
completion after TFLUSH?

Thanks,
Yuho
