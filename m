Received: from sonic308-17.consmr.mail.ir2.yahoo.com (sonic308-17.consmr.mail.ir2.yahoo.com [77.238.178.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B09846A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499120; cv=none; b=FL5Ounk8TFFhUne0r3X7xAH+bpC8qSux5HXgLmVQYpfXcZ42esBLvs0CYTvHwoiYi1ZsL0h5RDTOagLRcazaH2IFfC1fBBSM2UUCrKTeVmyW8Rv9FRml7x9Dt9iNabw/CrlT2efwPYVd4sI4neFjBvNp1Y/TIOhip41LoleysoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499120; c=relaxed/simple;
	bh=18zJkDzr62duq9aYUDivNzap0V8KYXPeytuSHMR3AM4=;
	h=Date:From:To:Message-ID:References:Subject:MIME-Version:
	 Content-Type; b=J+q1KsKuTHDqc3Ry67zpGSW3KIX5jHAZrUBXZbVhESvf+Z6DX7kwL1Zy46u9S1XDgBe3/MTgkuVayXt6uK9/SxNAVWTWTUMj84CC5xYt8ja8vLu6sSIooONjSLyRsqeE++8wfPOcKS0NP13oWql33dO6HbmsWspZ90fGaJVAXRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=JzOfPk0E; arc=none smtp.client-ip=77.238.178.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="JzOfPk0E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1790499116; bh=18zJkDzr62duq9aYUDivNzap0V8KYXPeytuSHMR3AM4=; h=Date:From:To:References:Subject:From:Subject:Reply-To; b=JzOfPk0E5tCxwwDy3FUNqs47DcOG9WwEFzNJAaoz8sC1hSsQPHwAZ+A7yVgaCxjR5IBZ/K/Vnqh5uXNS9YIj4pbiwPIMRzNDa0GOUvAZJuMJZoLOXezJglVV8yhM1GBnEczbiskMadNRdKcmZRL1jWx0Su1yMicpgYife+emd6nicxPWa7mpl386+shRvfadq5m694PkSrUxzwW+I8GTTFVFtjz97wkBm2/LZx7gIJOs+o/fUlPDDlmok6II0qjXK1vf0Es2EOpqb+sbm1fHtEu8/CmrJiBVBOHKCiI0ihFWWbFUBc/g9O9j40RgRADhza/KfD8saBEbjW0FpjOchA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1790499116; bh=IHsQ3MICkSupRNMTuX1lYTLHMZdw8PdDjdWDu+MKaIm=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=o708DBRJwh2MFCnY9kbDEO4bsnRQd2/b5xXuzN+gLordtD/d2ARcHblBoIB9WCNgzx5HaNeOEkQileG5TCB2yY42NWeHIuZXtknezU1L2S45pwNUoTQIHMhkq9SjnnnwORy4OkT6t7VuqhOfAgmF6h4NhNnx33XaPQVrNqnr8xMF5rRpr4zASJT1W+NkWOfMWeJok8QvqSy/FNnwXytQUiRKK97h/r43troQTWTCpWRk5PFq6HR7+fsyZgLacbKXcCEMLi5iTI9A3/0uF1FXlh6/glYJEK4mVhCW1RVhRkLc5MGjommZGTwWWGtZFRPMT3EN93Rf1LtvEv2xfGTRsw==
X-YMail-OSG: Fc2MWoAVM1nRky6tgK2ltAQH5tpil2QAx3Cc94HnQdiHt3x5hqfS1hQuW9i9j9L
 eJq8h0o1PzisPCHPxV4iEBehD1850Fj0KLCJ6GpaD8ZxpiMDMc3gXHqzl1Y6CUEab85QsKoxFBkY
 RyMMwF9LdrVXMJxXlMbnMesYa0MU.El6jMAN4d7G91yVVYVN7_JHvyT4CAOqWnz..0OHDhI6dgwR
 AtXbFHMoNU2l1hjAb7bkJ.Oj6i5kYjm.AJ771IEoJjpQlYqNYG1tQkIgtnpV1vIv6IKJ_FyJXpaJ
 .pZzYbFTH5e8TPmNd28PiPwYlNKwX67u4Uv2AcmM2SPu5GJE70PVS3QdWFNPcNexf7cvlPUvWQMr
 sxVio5qtohrbuA7R7pWWbbkzvBNa7T224W8G1HnifRKPz.rkAxEoS3lNywttX2M6EAb5RPvESec9
 F3F9dPQj150IAsRKf43qkfE6dzIIkaUp.xrs5D96xHTBkgLVCCuCz4kRGsF0.3xbF3k_K7EoPOa8
 6wfrFPw6.leCtlYbszHeJWspVQA_KGSYi_1hCVhzPpN_dE_j3.vQFvv8vRFHGXHgwerKTaMlM4D7
 pDsNrGO15eYA_JF8nGzR_vjg98RQy8uvDXCGVbBqCp097xs83lGesKgPY4NTo8_zuyWD_qh.hEVP
 hSGPvHljYjdI8gkkTaGQ1YUYKAvMeKmSwDTY8i8UIYpXlXbV3GQqRu5S8cWB7BEVx4bxgksHBUaj
 SJHX3NzI6WpozxhVYRGPVYWQjxzqSHkEJ6yqHx0kak6jcrqr4gI2nBxO1g7EgMFLiON0j_pO1DAP
 98s9_OqR07a5P_IAxf7q9CPMWBmPMpvjvseYJz6_POKYZuYlIxhM9Z4XO5dGb.8qssyKyJLAPIkW
 Qvuf0IxcwSTyVmseP8xoagGl9wTYrYLVZH9YuCKdlRH_SZdfk3EPQ_qbNNcQVejaX.G_whzlRfPY
 Wd7vdWL.piAcPaRT4bB9v7qJ8hcSIipQkn8.uyL2lT.2rfJR_jzO41lMBjXgTYj9sLlsQC3gSNal
 oZ.uwLJTN3AMk6IuO0_O2E8qt3L62AqQpxmylEqHGRx7.6G5oJ0svqdVt83RBrRBj8nlC4QPZMJw
 CK2qXKFsyy43SHeyQQfipwjPA_5iXXywTEGqHyzpYlqYNBEjifezRGZvvA6toRIoWwBqKCxeOWoS
 5o.vmq_5j6N6d0_YUew0yqsNqg9qyjQgxI1ENVhEZLMLcX6mOGEyrZWCB6.j4XNWSN52RJbqxqCG
 CYRNX35AUM7AyJsXXmSCypgZ6WVMaxePthGlgG10K0lmYgIfbSnhlvH1WpuJDhQ4uMlFEm2kNj16
 BCmXDDbwwhSAbrmQLnp6sWD.95M4ZrUfd4hxCzBrKU8KUXYiI5EflbmGFgp5O9oeNZGn0DaWQ1LG
 zdfQO66vkhrX_CMcx1CYYZURB.w8sdJhb_CeEg4Nj2dixdG1MAoJ80pHuDvfz4.cSX1RvIS.F73K
 CHYbA.WA_1V_Bje3SwHZ9s53xyN5M.IEl.IJ_4Nrhf6Cn4vUO6rhfudwtKHFKm5Y7wgvqeg7ukW_
 86uhLLeJyEmZZXMW8K3QH7s8hBF7C0Dp5SM3Xlf6RTpZNSzAsbmLVZgiA7DsTMqOBjqV92M8ebhq
 U0MaKNCw0SSBJ6.fh4hhiKvnyqnVQhOTAR3mKg7TVuhyupQzDltLt56SLuOGNkEzd9YUtL4LBvJX
 J32OaBY_dPyU0C0b7mhQmikutfRd5jJoRReYJX566Glw6v6KUsapztfLyDtGicmc8AOxx9rVnlGj
 YSXZJ4zLz.BR3F6hmaQEBiEqgSeZf8BHyKgbcst7PrIP.HgDb5OSCwUSg0hNDzr15d5NWUzqcci7
 4kRQYdO4_HJbormeXW4JY1foOIp7DKu60S1AJDxqxMJkUDNzIdIgSG.eXcVpEyWH0Nnb0NNWARUW
 DmKn_DMqQKZf6qo8.CdRXRKshnBxvL739RNF7FNpqytbcdy6KBAp1QyJqvGwFH5mGnCpg8Up_HMc
 G3iiwlJ1caEswpglp5EGHYEcYH24Z1hnH1FZ9ChTQ5WJ5c1UZLQb.p6cbKq5NCTMbKUfbAG19Fi6
 iVs0QU1t_fdqanf_uTM4pdUh0MkwMgHSiZQGWPipS9UI8WjVIIqTjRw--
X-Sonic-MF: <ak416_kingz@yahoo.com>
X-Sonic-ID: b5d2e1ac-bd78-4afd-a967-471eac55dfd5
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ir2.yahoo.com with HTTP; Sun, 27 Sep 2026 08:51:56 +0000
Date: Sun, 27 Sep 2026 07:56:40 +0000 (UTC)
From: Kingz Tuffa <ak416_kingz@yahoo.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>, 
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <378088904.1527494.1790495800044@mail.yahoo.com>
References: <378088904.1527494.1790495800044.ref@mail.yahoo.com>
Subject: greybus uart patch.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.26577 YMailNovation

 From: =3D?utf-8?q?Roberts=3D20Bric=3DC4=3DABtis?=3D <ak416_kingz@yahoo.com=
> Date: Sun, 27 Sep 2026 10:48:38 +0000 Subject: [PATCH] staging: greybus: =
uart: fix alignment to match open parenthesis MIME-Version: 1.0 Content-Typ=
e: text/plain; charset=3Dutf-8 Content-Transfer-Encoding: 8bit Clean up the=
 coding style in uart.c by aligning the arguments of wait_for_completion_ti=
meout() properly. Signed-off-by: Roberts Bric=C4=ABtis <ak416_kingz@yahoo.c=
om> --- drivers/staging/greybus/uart.c | 2 +- 1 file changed, 1 insertion(+=
), 1 deletion(-) diff --git a/drivers/staging/greybus/uart.c b/drivers/stag=
ing/greybus/uart.c index 24b4dab069c3..3d5ff4f65555 100644 --- a/drivers/st=
aging/greybus/uart.c +++ b/drivers/staging/greybus/uart.c @@ -318,7 +318,7 =
@@ static int gb_uart_wait_for_all_credits(struct gb_tty *gb_tty) return 0;=
 ret =3D wait_for_completion_timeout(&gb_tty->credits_complete, - msecs_to_=
jiffies(GB_UART_CREDIT_WAIT_TIMEOUT_MSEC)); + msecs_to_jiffies(GB_UART_CRED=
IT_WAIT_TIMEOUT_MSEC)); if (!ret) { dev_err(&gb_tty->gbphy_dev->dev, "time =
out waiting for credits\n"); -- 2.55.0=20
