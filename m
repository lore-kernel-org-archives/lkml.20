Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D92381AE3;
	Fri, 25 Sep 2026 14:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348226; cv=none; b=nYhD00piHcIAkOCJloBSqqOyq/pwNG05MCNt6sniA39C6l/0GrTCLj9O+s7gjK4pTTF9SwFGnx9FBY4nYb1USR+wQC/Uer55DolQqN63KGl359QryDUIXE58MdAc+Sr3LEpOu8e/MM7zLgmdYIdCJpulfctpriGWhBP+eBFGnCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348226; c=relaxed/simple;
	bh=Ye4VzUPaTcONMTtgdghzcBcZZ9CKM24Kn0LvNPMeB1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=miY3kcu8EYiFxAfO/PTEGypF1V8zHefbLOhSeBj3byWOiSL4FOfynEWdd0Zr0rLtREGoef93/0ym7V+0N0QM1aDHq6FGxwtzX6C0ZbjNqJ8xNBpWkCazPm8PXeJil7dSKiXhRt0pM58fdfwHkGPgFRqA4OwWboZsB/HZxTh5GCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FzurtVZb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FzurtVZb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA891F000FF;
	Fri, 25 Sep 2026 14:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790348204;
	bh=Bk6YJ/aQkyFMj6+ts72H5cCSnMwws9kqmVTKYrWwykA=;
	h=Date:From:To:Cc:Subject;
	b=FzurtVZbXngwpu/wPE2y+hyYJu1sPCTCWyInBRaX3Fg1nm1PajUioZfcfhyHs5HtV
	 J9NCWzqnBQ2nOBMv6raqPQTN0I0x/DGphNUPd7GsUd2ltW4UXxAPeWmMbSaP3BhgZd
	 75gF160rRmnd6FyfuPh6OkTW5Qiu63Zmgi1JWvtjBIeEo8J3ewqT5u5E/zn9FgcuMk
	 diS6+4p516e/4T4Ewhz0RrVeSeBxxsDf5mx6FDIipuv5rVEeOKrIYDrtuBMjyiGPc5
	 ZqurafJneKxHSW3AcZsxLheEzoMSsAn1C2W0FHLiWTMHnwkv4uCqwHUt59BJYNEomC
	 jODR2A5OB7HVg==
Date: Fri, 25 Sep 2026 15:56:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: linux-next: manual merge of the tty tree with the tty.current tree
Message-ID: <araLqC_JtkOWzZ1Z@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XTRxDXIztAMBKIzy"
Content-Disposition: inline


--XTRxDXIztAMBKIzy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tty tree got conflicts in:

  include/linux/soc/qcom/geni-se.h
  drivers/tty/serial/qcom_geni_serial.c

between commits:

  1cd9b1be5a9c5 ("soc: qcom: geni-se: Correct QUP Core ICC vote constants")
  63ef71d1474b5 ("tty: serial: qcom_geni_serial: Keep console RX functional=
 after deep idle")

=66rom the tty.current tree and commits:

  b815e9b19ea5c ("soc: qcom: geni-se: Correct QUP Core ICC vote constants")
  d147a15be6840 ("tty: serial: qcom_geni_serial: Keep console RX functional=
 after deep idle")

=66rom the tty tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/tty/serial/qcom_geni_serial.c
index a851b8f0ef047,3502a3b6675e8..0000000000000
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@@ -20,7 -20,6 +20,6 @@@
  #include <linux/module.h>
  #include <linux/of.h>
  #include <linux/panic_notifier.h>
- #include <linux/pm_domain.h>
  #include <linux/pm_opp.h>
  #include <linux/platform_device.h>
  #include <linux/pm_runtime.h>
@@@ -171,6 -170,7 +170,6 @@@ static void qcom_geni_serial_cancel_tx_
  static int qcom_geni_serial_port_setup(struct uart_port *uport);
  static void qcom_geni_serial_start_tx_fifo(struct uart_port *uport);
  static void qcom_geni_serial_resume_tx(struct uart_port *uport);
 -static void qcom_geni_serial_poll_rx_fifo_locked(struct uart_port *uport);
 =20
  static inline struct qcom_geni_serial_port *to_dev_port(struct uart_port =
*uport)
  {
@@@ -288,6 -288,10 +287,10 @@@ static struct qcom_geni_serial_port *ge
  	} else {
  		int max_alias_num =3D of_alias_get_highest_id("serial");
 =20
+ 		port =3D devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
+ 		if (!port)
+ 			return ERR_PTR(-ENOMEM);
+=20
  		if (line < 0 || line >=3D nr_ports)
  			line =3D ida_alloc_range(&port_ida, max_alias_num + 1,
  					       nr_ports - 1, GFP_KERNEL);
@@@ -298,10 -302,6 +301,6 @@@
  		if (line < 0)
  			return ERR_PTR(-ENXIO);
 =20
- 		port =3D devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
- 		if (!port)
- 			return ERR_PTR(-ENOMEM);
-=20
  		port->uport.iotype =3D UPIO_MEM;
  		port->uport.ops =3D &qcom_geni_uart_pops;
  		port->uport.flags =3D UPF_BOOT_AUTOCONF;
@@@ -466,102 -466,6 +465,102 @@@ static int qcom_geni_serial_poll_init(s
  #endif
 =20
  #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
 +static void handle_rx_console(struct uart_port *uport, u32 bytes, bool dr=
op)
 +{
 +	u32 i;
 +	unsigned char buf[sizeof(u32)];
 +	struct tty_port *tport;
 +	struct qcom_geni_serial_port *port =3D to_dev_port(uport);
 +
 +	tport =3D &uport->state->port;
 +	for (i =3D 0; i < bytes; ) {
 +		int c;
 +		int chunk =3D min_t(int, bytes - i, BYTES_PER_FIFO_WORD);
 +
 +		ioread32_rep(uport->membase + SE_GENI_RX_FIFOn, buf, 1);
 +		i +=3D chunk;
 +		if (drop)
 +			continue;
 +
 +		for (c =3D 0; c < chunk; c++) {
 +			int sysrq;
 +
 +			uport->icount.rx++;
 +			if (port->brk && buf[c] =3D=3D 0) {
 +				port->brk =3D false;
 +				if (uart_handle_break(uport))
 +					continue;
 +			}
 +
 +			sysrq =3D uart_prepare_sysrq_char(uport, buf[c]);
 +
 +			if (!sysrq)
 +				tty_insert_flip_char(tport, buf[c], TTY_NORMAL);
 +		}
 +	}
 +	if (!drop)
 +		tty_flip_buffer_push(tport);
 +}
 +#else
 +static void handle_rx_console(struct uart_port *uport, u32 bytes, bool dr=
op)
 +{
 +
 +}
 +#endif
 +
 +static void qcom_geni_serial_handle_rx_fifo(struct uart_port *uport, bool=
 drop)
 +{
 +	u32 status;
 +	u32 word_cnt;
 +	u32 last_word_byte_cnt;
 +	u32 last_word_partial;
 +	u32 total_bytes;
 +
 +	status =3D readl(uport->membase +	SE_GENI_RX_FIFO_STATUS);
 +	word_cnt =3D status & RX_FIFO_WC_MSK;
 +	last_word_partial =3D status & RX_LAST;
 +	last_word_byte_cnt =3D (status & RX_LAST_BYTE_VALID_MSK) >>
 +						RX_LAST_BYTE_VALID_SHFT;
 +
 +	if (!word_cnt)
 +		return;
 +	total_bytes =3D BYTES_PER_FIFO_WORD * (word_cnt - 1);
 +	if (last_word_partial && last_word_byte_cnt)
 +		total_bytes +=3D last_word_byte_cnt;
 +	else
 +		total_bytes +=3D BYTES_PER_FIFO_WORD;
 +	handle_rx_console(uport, total_bytes, drop);
 +}
 +
 +#ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
 +/* Caller holds the UART port lock. */
 +static void qcom_geni_serial_poll_rx_fifo_locked(struct uart_port *uport)
 +{
 +	struct qcom_geni_serial_port *port =3D to_dev_port(uport);
 +	struct tty_port *tport =3D &uport->state->port;
 +	u32 s_irq_status;
 +	bool drop_rx =3D false;
 +
 +	s_irq_status =3D readl(uport->membase + SE_GENI_S_IRQ_STATUS);
 +	writel(s_irq_status, uport->membase + SE_GENI_S_IRQ_CLEAR);
 +
 +	if (s_irq_status & S_RX_FIFO_WR_ERR_EN) {
 +		uport->icount.overrun++;
 +		tty_insert_flip_char(tport, 0, TTY_OVERRUN);
 +	}
 +
 +	if (s_irq_status & (S_GP_IRQ_0_EN | S_GP_IRQ_1_EN)) {
 +		if (s_irq_status & S_GP_IRQ_0_EN)
 +			uport->icount.parity++;
 +		drop_rx =3D true;
 +	} else if (s_irq_status & (S_GP_IRQ_2_EN | S_GP_IRQ_3_EN)) {
 +		uport->icount.brk++;
 +		port->brk =3D true;
 +	}
 +
 +	qcom_geni_serial_handle_rx_fifo(uport, drop_rx);
 +}
 +
  static void qcom_geni_serial_drain_fifo(struct uart_port *uport)
  {
  	struct qcom_geni_serial_port *port =3D to_dev_port(uport);
@@@ -771,6 -675,47 +770,6 @@@ static void qcom_geni_serial_console_de
  #endif
  }
 =20
 -static void handle_rx_console(struct uart_port *uport, u32 bytes, bool dr=
op)
 -{
 -	u32 i;
 -	unsigned char buf[sizeof(u32)];
 -	struct tty_port *tport;
 -	struct qcom_geni_serial_port *port =3D to_dev_port(uport);
 -
 -	tport =3D &uport->state->port;
 -	for (i =3D 0; i < bytes; ) {
 -		int c;
 -		int chunk =3D min_t(int, bytes - i, BYTES_PER_FIFO_WORD);
 -
 -		ioread32_rep(uport->membase + SE_GENI_RX_FIFOn, buf, 1);
 -		i +=3D chunk;
 -		if (drop)
 -			continue;
 -
 -		for (c =3D 0; c < chunk; c++) {
 -			int sysrq;
 -
 -			uport->icount.rx++;
 -			if (port->brk && buf[c] =3D=3D 0) {
 -				port->brk =3D false;
 -				if (uart_handle_break(uport))
 -					continue;
 -			}
 -
 -			sysrq =3D uart_prepare_sysrq_char(uport, buf[c]);
 -
 -			if (!sysrq)
 -				tty_insert_flip_char(tport, buf[c], TTY_NORMAL);
 -		}
 -	}
 -	if (!drop)
 -		tty_flip_buffer_push(tport);
 -}
 -#else
 -static void handle_rx_console(struct uart_port *uport, u32 bytes, bool dr=
op)
 -{
 -
 -}
  #endif /* CONFIG_SERIAL_QCOM_GENI_CONSOLE */
 =20
  static void handle_rx_uart(struct uart_port *uport, u32 bytes)
@@@ -944,6 -889,58 +943,6 @@@ static void qcom_geni_serial_cancel_tx_
  	port->tx_queued =3D 0;
  }
 =20
 -static void qcom_geni_serial_handle_rx_fifo(struct uart_port *uport, bool=
 drop)
 -{
 -	u32 status;
 -	u32 word_cnt;
 -	u32 last_word_byte_cnt;
 -	u32 last_word_partial;
 -	u32 total_bytes;
 -
 -	status =3D readl(uport->membase +	SE_GENI_RX_FIFO_STATUS);
 -	word_cnt =3D status & RX_FIFO_WC_MSK;
 -	last_word_partial =3D status & RX_LAST;
 -	last_word_byte_cnt =3D (status & RX_LAST_BYTE_VALID_MSK) >>
 -						RX_LAST_BYTE_VALID_SHFT;
 -
 -	if (!word_cnt)
 -		return;
 -	total_bytes =3D BYTES_PER_FIFO_WORD * (word_cnt - 1);
 -	if (last_word_partial && last_word_byte_cnt)
 -		total_bytes +=3D last_word_byte_cnt;
 -	else
 -		total_bytes +=3D BYTES_PER_FIFO_WORD;
 -	handle_rx_console(uport, total_bytes, drop);
 -}
 -
 -/* Caller holds the UART port lock. */
 -static void qcom_geni_serial_poll_rx_fifo_locked(struct uart_port *uport)
 -{
 -	struct qcom_geni_serial_port *port =3D to_dev_port(uport);
 -	struct tty_port *tport =3D &uport->state->port;
 -	u32 s_irq_status;
 -	bool drop_rx =3D false;
 -
 -	s_irq_status =3D readl(uport->membase + SE_GENI_S_IRQ_STATUS);
 -	writel(s_irq_status, uport->membase + SE_GENI_S_IRQ_CLEAR);
 -
 -	if (s_irq_status & S_RX_FIFO_WR_ERR_EN) {
 -		uport->icount.overrun++;
 -		tty_insert_flip_char(tport, 0, TTY_OVERRUN);
 -	}
 -
 -	if (s_irq_status & (S_GP_IRQ_0_EN | S_GP_IRQ_1_EN)) {
 -		if (s_irq_status & S_GP_IRQ_0_EN)
 -			uport->icount.parity++;
 -		drop_rx =3D true;
 -	} else if (s_irq_status & (S_GP_IRQ_2_EN | S_GP_IRQ_3_EN)) {
 -		uport->icount.brk++;
 -		port->brk =3D true;
 -	}
 -
 -	qcom_geni_serial_handle_rx_fifo(uport, drop_rx);
 -}
 -
  static void qcom_geni_serial_stop_rx_fifo(struct uart_port *uport)
  {
  	u32 irq_en;
@@@ -1293,7 -1290,6 +1292,6 @@@ out_unlock
  static int setup_fifos(struct qcom_geni_serial_port *port)
  {
  	struct uart_port *uport;
- 	u32 old_rx_fifo_depth =3D port->rx_fifo_depth;
 =20
  	uport =3D &port->uport;
  	port->tx_fifo_depth =3D geni_se_get_tx_fifo_depth(&port->se);
@@@ -1302,19 -1298,6 +1300,6 @@@
  	uport->fifosize =3D
  		(port->tx_fifo_depth * port->tx_fifo_width) / BITS_PER_BYTE;
 =20
- 	if (port->rx_buf && (old_rx_fifo_depth !=3D port->rx_fifo_depth) && port=
->rx_fifo_depth) {
- 		/*
- 		 * Use krealloc rather than krealloc_array because rx_buf is
- 		 * accessed as 1 byte entries as well as 4 byte entries so it's
- 		 * not necessarily an array.
- 		 */
- 		port->rx_buf =3D devm_krealloc(uport->dev, port->rx_buf,
- 					     port->rx_fifo_depth * sizeof(u32),
- 					     GFP_KERNEL);
- 		if (!port->rx_buf)
- 			return -ENOMEM;
- 	}
-=20
  	return 0;
  }
 =20
@@@ -1484,7 -1467,7 +1469,7 @@@ static int geni_serial_set_rate(struct=20
  	 * Bump up BW vote on CPU and CORE path as driver supports FIFO mode
  	 * only.
  	 */
- 	avg_bw_core =3D baud > 115200 ? CORE_2X_50_MHZ : CORE_2X_19_2_MHZ;
+ 	avg_bw_core =3D (baud > 115200) ? CORE_2X_50_MHZ : CORE_2X_19_2_MHZ;
  	port->se.icc_paths[GENI_TO_CORE].avg_bw =3D Bps_to_icc(avg_bw_core);
  	port->se.icc_paths[CPU_TO_GENI].avg_bw =3D Bps_to_icc(baud);
  	geni_icc_set_bw(&port->se);
@@@ -1626,37 -1609,16 +1611,37 @@@ static int qcom_geni_console_setup(stru
  	if (unlikely(!uport->membase))
  		return -ENXIO;
 =20
 +	ret =3D pm_runtime_resume_and_get(uport->dev);
 +	if (ret < 0)
 +		return ret;
 +
  	if (!port->setup) {
  		ret =3D qcom_geni_serial_port_setup(uport);
 -		if (ret)
 +		if (ret) {
 +			pm_runtime_put_sync(uport->dev);
  			return ret;
 +		}
  	}
 =20
  	if (options)
  		uart_parse_options(options, &baud, &parity, &bits, &flow);
 =20
 -	return uart_set_options(uport, co, baud, parity, bits, flow);
 +	ret =3D uart_set_options(uport, co, baud, parity, bits, flow);
 +	if (ret)
 +		pm_runtime_put_sync(uport->dev);
 +
 +	return ret;
 +}
 +
 +static int qcom_geni_console_exit(struct console *co)
 +{
 +	struct qcom_geni_serial_port *port;
 +
 +	port =3D get_port_from_line(co->index, true, NULL);
 +	if (IS_ERR(port))
 +		return PTR_ERR(port);
 +
 +	return pm_runtime_put_sync(port->uport.dev);
  }
 =20
  static void qcom_geni_serial_earlycon_write(struct console *con,
@@@ -1773,7 -1735,6 +1758,7 @@@ static struct console cons_ops =3D=20
  	.device_unlock =3D qcom_geni_serial_console_device_unlock,
  	.device =3D uart_console_device,
  	.setup =3D qcom_geni_console_setup,
 +	.exit =3D qcom_geni_console_exit,
  	.flags =3D CON_PRINTBUFFER | CON_NBCON,
  	.index =3D -1,
  	.data =3D &qcom_geni_console_driver,
@@@ -1920,7 -1881,7 +1905,7 @@@ static int qcom_geni_serial_probe(struc
 =20
  	ret =3D port->dev_data->resources_init(&port->se);
  	if (ret)
- 		return ret;
+ 		goto error;
 =20
  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
  	if (!res) {
@@@ -1970,8 -1931,13 +1955,13 @@@
  	uport->irq =3D irq;
  	uport->has_sysrq =3D IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE);
 =20
- 	if (!data->console)
+ 	if (!data->console) {
  		port->wakeup_irq =3D platform_get_irq_optional(pdev, 1);
+ 		if (port->wakeup_irq < 0 && port->wakeup_irq !=3D -ENXIO) {
+ 			ret =3D port->wakeup_irq;
+ 			goto error;
+ 		}
+ 	}
 =20
  	if (of_property_read_bool(pdev->dev.of_node, "rx-tx-swap"))
  		port->rx_tx_swap =3D true;
@@@ -2002,7 -1968,6 +1992,6 @@@
  						port->wakeup_irq);
  		if (ret) {
  			device_init_wakeup(&pdev->dev, false);
- 			ida_free(&port_ida, uport->line);
  			goto error;
  		}
  	}
@@@ -2026,12 -1991,13 +2015,13 @@@
  	return 0;
 =20
  error:
+ 	if (!data->console)
+ 		ida_free(&port_ida, uport->line);
  	if (port->rx_dma_addr) {
  		dma_unmap_single(pdev->dev.parent, port->rx_dma_addr,
  				 DMA_RX_BUF_SIZE, DMA_FROM_DEVICE);
  		port->rx_dma_addr =3D 0;
  	}
- 	dev_pm_domain_detach_list(port->se.pd_list);
  	return ret;
  }
 =20
@@@ -2047,7 -2013,8 +2037,8 @@@ static void qcom_geni_serial_remove(str
  	irq_work_sync(&port->tx_kick);
  	dev_pm_clear_wake_irq(&pdev->dev);
  	device_init_wakeup(&pdev->dev, false);
- 	ida_free(&port_ida, uport->line);
+ 	if (!port->dev_data->console)
+ 		ida_free(&port_ida, uport->line);
  	uart_remove_one_port(drv, &port->uport);
 =20
  	if (port->rx_dma_addr) {
@@@ -2055,8 -2022,6 +2046,6 @@@
  				 DMA_RX_BUF_SIZE, DMA_FROM_DEVICE);
  		port->rx_dma_addr =3D 0;
  	}
-=20
- 	dev_pm_domain_detach_list(port->se.pd_list);
  }
 =20
  static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device =
*dev)
@@@ -2122,11 -2087,9 +2111,11 @@@ static int qcom_geni_serial_resume(stru
  	struct uart_port *uport =3D &port->uport;
  	struct qcom_geni_private_data *private_data =3D uport->private_data;
 =20
 -	ret =3D pm_runtime_force_resume(dev);
 -	if (ret)
 -		return ret;
 +	if (console_suspend_enabled || !uart_console(uport)) {
 +		ret =3D pm_runtime_force_resume(dev);
 +		if (ret)
 +			return ret;
 +	}
 =20
  	ret =3D uart_resume_port(private_data->drv, uport);
  	if (uart_console(uport)) {
diff --combined include/linux/soc/qcom/geni-se.h
index 5f18d281e6a42,2243005f5e2ee..0000000000000
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@@ -347,12 -347,18 +347,18 @@@ struct geni_se=20
  #define QUP_SE_VERSION_2_5                  0x20050000
 =20
  /*
-  * QUP Core 2X clock votes used by GENI clients through the "qup-core" ICC
-  * path. Values are in Bps and must be converted with Bps_to_icc() before
-  * setting avg_bw.
+  * ICC bandwidth values in Bps for the GENI_TO_CORE ("qup-core") path.
+  * Convert them with Bps_to_icc() before setting avg_bw. The QUP ICC prov=
ider
+  * maps each threshold to the Core 2X rate named by the macro suffix.
+  *
+  * These values are core clock votes, not GENI transfer bandwidths.
   */
  #define CORE_2X_19_2_MHZ		9600000
  #define CORE_2X_50_MHZ			25000000
+ #define CORE_2X_100_MHZ			50000000
+ #define CORE_2X_150_MHZ			75000000
+ #define CORE_2X_200_MHZ			100000000
+ #define CORE_2X_236_MHZ			118000000
 =20
  #define GENI_DEFAULT_BW			Bps_to_icc(1000)
 =20

--XTRxDXIztAMBKIzy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2i6cACgkQJNaLcl1U
h9Ay1Af9HgDk0NjCp7PqbZEE173OfJOiC/maCCZdvk2EWaqYTOM1jp9WUoVnzp2R
OTG0xx7cgixXWVJgL2zytdZT7PMnbReY59vaRVULlU6i06T4NH/3WjxBMIwlRv3X
bV1UpjGyONxqmwLY0vg9kOuLtK1cA4wVpb6BfxnOMPVdZrTDbXxBT1xsQlJ1DvEM
ftcCnRvWG7YIz+wH3rtMC82jvbDqljdgks7q2QjR5b4hH4c10gD59JpYRKj95690
4Wky014Agh9gK6HvM6d07NLhx1UnKf+scmgOt9u/smNsZovwPes5YY5nuliqxsRC
SijAPZ4vyccClvGPk1EOfS2LhpyGYA==
=xfUd
-----END PGP SIGNATURE-----

--XTRxDXIztAMBKIzy--
