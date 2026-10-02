Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B397D233149;
	Fri,  2 Oct 2026 18:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790964783; cv=none; b=Wd1/Qx9HmKGvv+YI6ahgKE6vk9CYHxgqmOg/cmWYwPgEA6yXgx7dcX1M/zDx/rvMVIRqBxETfbH04ehZBaOPCCHW2N9M3y8Y+9P4lBERTYZL3dss6aj4WFX6kzQkeZdTDgQA2gvKXNNh4F1qRJ4BSGTPFPD8hZ4oPIgWe4JaaJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790964783; c=relaxed/simple;
	bh=EVWEEwlXLhNjF2ME7vySK6/WCegc7/1Os47t5ZP/tqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aS3s7PdfdRX5cK8VJ9SEnJsichwJfxWMyjb6007PXxQeO93cz+Fj8Us57VrSWu5kfk4TUNQci69YjpvT3lWQbJ/eenyq6riRocHKhT4m4yv0nft/mpz7StlMwcGjSrhTYEdJofvhsRbPFLS6tm4UOqONgf5IQzivM6TThvLB4cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W24U7MK4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W24U7MK4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67CC21F000FF;
	Fri,  2 Oct 2026 18:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790964781;
	bh=4luBYBPx+DhaKsC16JVWzjK+8aBxrlqZAamqUXc7ftU=;
	h=Date:From:To:Cc:Subject;
	b=W24U7MK4w6Snj9U98tyhbeTyeLqc2+zkV5PCrp7lYxCadHR5y6cuCPJT7Mld++vzi
	 X47/nCXIFzH13lppVnQsy7Er+/5KchL/iHyAComkbdCcQvZweTRomKZYAPzqNXBURb
	 NLMQU1CKVBgBbSgc/86ngSIzGsPd5U3/57wUdw72pcJyWctnXN9ByK8DESYeufLBcv
	 Ja9hLn6P1ushUXIrQVfEQTbFK13wD4/NPW6t/WHBslFbJTd3dTlTr2hnMO2UnOx/le
	 aj1mho/ZGndG+4Z8d6ZMktd/M1W4AtrFTmZr68T1q20OxDpBiP/PkYvrDuXDw6s09B
	 YoQUnqWP7J0cw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A67C91AC57CE; Fri, 02 Oct 2026 19:12:57 +0100 (BST)
Date: Fri, 2 Oct 2026 19:12:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Cui GaoSheng <cuigaosheng1@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Ruslan Valiyev <linuxoid@gmail.com>
Subject: linux-next: manual merge of the tty tree with the tty.current tree
Message-ID: <ar_0KTUpkndGyONa@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JoPIK20AwyW1dWwv"
Content-Disposition: inline


--JoPIK20AwyW1dWwv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tty tree got a conflict in:

  drivers/tty/serial/serial_core.c

between commit:

  499485a67fbac ("serial: core: fix NULL pointer dereference in serial_core=
_unregister_port()")

=66rom the tty.current tree and commit:

  b290393074a14 ("serial: core: fix NULL/dangling port_dev on failed re-reg=
ister")

=66rom the tty tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/tty/serial/serial_core.c
index 6332ed545c899,d811a04d5d25c..0000000000000
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@@ -33,7 -33,6 +33,6 @@@
  #include <linux/uaccess.h>
 =20
  #include "serial_base.h"
- #include "8250/8250.h" /* For hub6_match_port() */
 =20
  /*
   * This is used to lock changes in serial line configuration.
@@@ -247,29 -246,29 +246,29 @@@ static int uart_alloc_xmit_buf(struct t
  	struct uart_state *state =3D container_of(port, struct uart_state, port);
  	struct uart_port *uport;
  	unsigned long flags;
- 	unsigned long page;
+ 	u8 *buf;
 =20
  	/*
  	 * Initialise and allocate the transmit and temporary
  	 * buffer.
  	 */
- 	page =3D get_zeroed_page(GFP_KERNEL);
- 	if (!page)
+ 	buf =3D kzalloc(PAGE_SIZE, GFP_KERNEL);
+ 	if (!buf)
  		return -ENOMEM;
 =20
  	uport =3D uart_port_ref_lock(state, &flags);
  	if (!state->port.xmit_buf) {
- 		state->port.xmit_buf =3D (unsigned char *)page;
+ 		state->port.xmit_buf =3D buf;
  		kfifo_init(&state->port.xmit_fifo, state->port.xmit_buf,
  				PAGE_SIZE);
  		uart_port_unlock_deref(uport, flags);
  	} else {
  		uart_port_unlock_deref(uport, flags);
  		/*
- 		 * Do not free() the page under the port lock, see
+ 		 * Do not free() the buffer under the port lock, see
  		 * uart_free_xmit_buf().
  		 */
- 		free_page(page);
+ 		kfree(buf);
  	}
 =20
  	return 0;
@@@ -280,10 -279,10 +279,10 @@@ static void uart_free_xmit_buf(struct t
  	struct uart_state *state =3D container_of(port, struct uart_state, port);
  	struct uart_port *uport;
  	unsigned long flags;
- 	char *xmit_buf;
+ 	u8 *xmit_buf;
 =20
  	/*
- 	 * Do not free() the transmit buffer page under the port lock since
+ 	 * Do not free() the transmit buffer under the port lock since
  	 * this can create various circular locking scenarios. For instance,
  	 * console driver may need to allocate/free a debug object, which
  	 * can end up in printk() recursion.
@@@ -294,7 -293,7 +293,7 @@@
  	INIT_KFIFO(port->xmit_fifo);
  	uart_port_unlock_deref(uport, flags);
 =20
- 	free_page((unsigned long)xmit_buf);
+ 	kfree(xmit_buf);
  }
 =20
  /*
@@@ -896,7 -895,7 +895,7 @@@ static int uart_set_info(struct tty_str
  	upf_t old_flags, new_flags;
  	int retval;
 =20
 -	if (!uport)
 +	if (!uport || tty_io_error(tty))
  		return -EIO;
 =20
  	new_port =3D new_info->port;
@@@ -1119,7 -1118,7 +1118,7 @@@ static int uart_break_ctl(struct tty_st
  	guard(mutex)(&port->mutex);
 =20
  	uport =3D uart_port_check(state);
 -	if (!uport)
 +	if (!uport || tty_io_error(tty))
  		return -EIO;
 =20
  	if (uport->type !=3D PORT_UNKNOWN && uport->ops->break_ctl)
@@@ -1144,7 -1143,7 +1143,7 @@@ static int uart_do_autoconfig(struct tt
  	 */
  	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &port->mutex) {
  		uport =3D uart_port_check(state);
 -		if (!uport)
 +		if (!uport || tty_io_error(tty))
  			return -EIO;
 =20
  		if (tty_port_users(port) !=3D 1)
@@@ -1199,7 -1198,7 +1198,7 @@@ static void uart_enable_ms(struct uart_
   * FIXME: This wants extracting into a common all driver implementation
   * of TIOCMWAIT using tty_port.
   */
 -static int uart_wait_modem_status(struct uart_state *state, unsigned long=
 arg)
 +static int uart_wait_modem_status(struct tty_struct *tty, struct uart_sta=
te *state, unsigned long arg)
  {
  	struct uart_port *uport;
  	struct tty_port *port =3D &state->port;
@@@ -1213,29 -1212,18 +1212,29 @@@
  	uport =3D uart_port_ref(state);
  	if (!uport)
  		return -EIO;
 -	scoped_guard(uart_port_lock_irq, uport) {
 -		memcpy(&cprev, &uport->icount, sizeof(struct uart_icount));
 -		uart_enable_ms(uport);
 +
 +	mutex_lock(&port->mutex);
 +	if (tty_io_error(tty)) {
 +		mutex_unlock(&port->mutex);
 +		ret =3D -EIO;
 +		goto out_deref;
  	}
 =20
 +	uart_port_lock_irq(uport);
 +	memcpy(&cprev, &uport->icount, sizeof(struct uart_icount));
 +	uart_enable_ms(uport);
 +	uart_port_unlock_irq(uport);
 +
 +	mutex_unlock(&port->mutex);
 +
  	add_wait_queue(&port->delta_msr_wait, &wait);
  	for (;;) {
 -		scoped_guard(uart_port_lock_irq, uport)
 -			memcpy(&cnow, &uport->icount, sizeof(struct uart_icount));
 -
  		set_current_state(TASK_INTERRUPTIBLE);
 =20
 +		uart_port_lock_irq(uport);
 +		memcpy(&cnow, &uport->icount, sizeof(struct uart_icount));
 +		uart_port_unlock_irq(uport);
 +
  		if (((arg & TIOCM_RNG) && (cnow.rng !=3D cprev.rng)) ||
  		    ((arg & TIOCM_DSR) && (cnow.dsr !=3D cprev.dsr)) ||
  		    ((arg & TIOCM_CD)  && (cnow.dcd !=3D cprev.dcd)) ||
@@@ -1244,11 -1232,6 +1243,11 @@@
  			break;
  		}
 =20
 +		if (tty_io_error(tty)) {
 +			ret =3D -EIO;
 +			break;
 +		}
 +
  		schedule();
 =20
  		/* see if a signal did it */
@@@ -1261,7 -1244,6 +1260,7 @@@
  	}
  	__set_current_state(TASK_RUNNING);
  	remove_wait_queue(&port->delta_msr_wait, &wait);
 +out_deref:
  	uart_port_deref(uport);
 =20
  	return ret;
@@@ -1584,7 -1566,7 +1583,7 @@@ uart_ioctl(struct tty_struct *tty, unsi
 =20
  	/* This should only be used when the hardware is present. */
  	if (cmd =3D=3D TIOCMIWAIT)
 -		return uart_wait_modem_status(state, arg);
 +		return uart_wait_modem_status(tty, state, arg);
 =20
  	/* rs485_config requires more locking than others */
  	if (cmd =3D=3D TIOCSRS485)
@@@ -1640,13 -1622,14 +1639,13 @@@ static void uart_set_ldisc(struct tty_s
  {
  	struct uart_state *state =3D tty->driver_data;
  	struct uart_port *uport;
 -	struct tty_port *port =3D &state->port;
 -
 -	if (!tty_port_initialized(port))
 -		return;
 =20
  	guard(mutex)(&state->port.mutex);
  	uport =3D uart_port_check(state);
 -	if (uport && uport->ops->set_ldisc)
 +	if (!uport || tty_io_error(tty))
 +		return;
 +
 +	if (uport->ops->set_ldisc)
  		uport->ops->set_ldisc(uport, &tty->termios);
  }
 =20
@@@ -1662,7 -1645,7 +1661,7 @@@ static void uart_set_termios(struct tty
  	guard(mutex)(&state->port.mutex);
 =20
  	uport =3D uart_port_check(state);
 -	if (!uport)
 +	if (!uport || tty_io_error(tty))
  		return;
 =20
  	/*
@@@ -1814,14 -1797,7 +1813,14 @@@ static void uart_wait_until_sent(struc
  	 * 'timeout' / 'expire' give us the maximum amount of time
  	 * we wait.
  	 */
 -	while (!port->ops->tx_empty(port)) {
 +	for (;;) {
 +		mutex_lock(&state->port.mutex);
 +		if (tty_io_error(tty) || port->ops->tx_empty(port)) {
 +			mutex_unlock(&state->port.mutex);
 +			break;
 +		}
 +		mutex_unlock(&state->port.mutex);
 +
  		msleep_interruptible(jiffies_to_msecs(char_time));
  		if (signal_pending(current))
  			break;
@@@ -2133,7 -2109,8 +2132,8 @@@ EXPORT_SYMBOL_GPL(uart_console_write)
 =20
  /**
   * uart_parse_earlycon - Parse earlycon options
-  * @p:	     ptr to 2nd field (ie., just beyond '<name>,')
+  * @p:	     ptr to 2nd field (ie., just beyond '<name>,'); %NULL if
+  *	     no console options were supplied
   * @iotype:  ptr for decoded iotype (out)
   * @addr:    ptr for decoded mapbase/iobase (out)
   * @options: ptr for <options> field; %NULL if not present (out)
@@@ -2153,6 -2130,9 +2153,9 @@@
  int uart_parse_earlycon(char *p, enum uart_iotype *iotype,
  			resource_size_t *addr, char **options)
  {
+ 	if (!p)
+ 		return -EINVAL;
+=20
  	if (strncmp(p, "mmio,", 5) =3D=3D 0) {
  		*iotype =3D UPIO_MEM;
  		p +=3D 5;
@@@ -3256,32 -3236,6 +3259,6 @@@ static void serial_core_remove_one_port
  	state->uart_port =3D NULL;
  }
 =20
- /**
-  * uart_match_port - are the two ports equivalent?
-  * @port1: first port
-  * @port2: second port
-  *
-  * This utility function can be used to determine whether two uart_port
-  * structures describe the same port.
-  */
- bool uart_match_port(const struct uart_port *port1,
- 		const struct uart_port *port2)
- {
- 	if (port1->iotype !=3D port2->iotype)
- 		return false;
- 	else if (port1->iotype =3D=3D UPIO_PORT)
- 		return port1->iobase =3D=3D port2->iobase;
- 	else if (port1->iotype =3D=3D UPIO_HUB6)
- 		return hub6_match_port(port1, port2);
- 	else if (uart_iotype_mmio(port1->iotype))
- 		return port1->mapbase =3D=3D port2->mapbase;
- 	else if (port1->iotype =3D=3D UPIO_BUS)
- 		return true;
- 	else
- 		return false;
- }
- EXPORT_SYMBOL(uart_match_port);
-=20
  static struct serial_ctrl_device *
  serial_core_get_ctrl_dev(struct serial_port_device *port_dev)
  {
@@@ -3402,12 -3356,7 +3379,12 @@@ void serial_core_unregister_port(struc
 =20
  	guard(mutex)(&port_mutex);
 =20
 -	/* May have never been registered. */
 +	/*
 +	 * A NULL port device means there is no registered port device to
 +	 * remove: serial_core_remove_one_port() clears port_dev on
 +	 * teardown, and it is never set if registration failed before
 +	 * serial_core_port_device_add().
 +	 */
  	port_dev =3D port->port_dev;
  	if (!port_dev)
  		return;

--JoPIK20AwyW1dWwv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCar/0KQAKCRAv73Ows9A4
iZPaAP9Qkcu8raII4OFv5cHHIj/87T4Ryyfqafnb7j/+QQWDHwD/akGy5if4ucGt
s1HXlfjlILkLlf514qxXU+KFdCP6xAM=
=oRvA
-----END PGP SIGNATURE-----

--JoPIK20AwyW1dWwv--
