Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722349;
	b=mgUlhFywpOznqie3yGnxMnik4oUTLX1op6XxJs/F0+2txZ/HK49eckhEcO9ASZLcU1Q5
	 0/9QmVNsQgxC5wwBorf6C3wgWgbKbLEAkR76njNirg7T8X32P6Ew1TW31bxGnJjpKFRcj
	 Cg/P2pQy6Q+71IcVr/sPJHcPhgKuIQ7kfDfnLF1jPnI2kuyzX+HYeSw2jMohi/irb8dVh
	 v6TflzfR/fPAtH68SQgiqu20o2mFa3JgEjQhL9HrAUJLKaNfvt1pK7y5ne0Piw35xksiq
	 TTji+1RXKcHSQpx+OAOFxz1ELTDvfYHIuQy50thTbga/YNt6rYXAM04+UHmidghjghQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=k3wOXwT/k0LbDBrntawfvyLqtjKreuDEhwrYfhEh6/k=;
	b=JNeERWgvaX9Z7yHOcaTZa9aBUoiCsE/skkaCJjEw9PWN5GyfsGUTOtFo9SQiwZqJX4dH
	 OV0JPTzQswKiQte19sqV1NtTqscfpr1fo2AqKU0ervWhhokQUpifs8f5Na5KUsSMXfCWE
	 xPnpfvzBtbQmgtuWg5gCAp4QQrPvXYDTVyrU6s6mOkWlUwtUGRaq+kYSeQsTf0UTHvVKw
	 5rv/dx1SaQImFYMlxruLnliGUjwTdrFQi4YcsYU+cE1hD2dDbfeHAWb9Sy2duiVn4L9Ol
	 ifsHVqwF40PJ07xJR1FvJ5MLZdPSRt5reehbn34yryOI9HiGPvA5tq242VTZlVpqgJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=beagleboard.org;
	spf=fail smtp.mailfrom=beagleboard.org;
	dkim=pass header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=tutmjVCb;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70769606D803
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70769606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=tutmjVCb
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-353804b591eso7504267eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1793722347; x=1794327147; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k3wOXwT/k0LbDBrntawfvyLqtjKreuDEhwrYfhEh6/k=;
        b=tutmjVCbafnKZ5xd+rUmHojIuJviiEwrd6OnDwB1Fa2khQDZJtwC8eG0R06a869fIc
         aVumRSRA+CGPl+cqnNBoN90OYx4GAszZdLxC/jU13RmIF5+W1BOZpLBV1O3C3+x/MJv4
         VAMQEiF7yWx6SLoeKoJTpMIoohd3nehS4/1dg5q4+qpbpw0x2jc3T2flHAQWyqT8hXqc
         5r3CiIv5HbUvl9IRQEZrxzYHLMrBzzZxX5jXhF9og/hxjAvO9WgbjM5qhRMhjq2FOT/R
         UVnV7s0aJ5Q4jvXQ4m8ohgCGJls+Q5SRgPKOUjHWtTvLS3fHq+UGNTkXIuH1cg+uMKKO
         BMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722347; x=1794327147;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k3wOXwT/k0LbDBrntawfvyLqtjKreuDEhwrYfhEh6/k=;
        b=VrRez+yBzGUhGkyaPh2rKcqTlFtkAUbC4XetIxJd5qUfTvWGpwmCFa1og0iMTSOpDt
         VhuYSDSDHZoOW56A3JY/qUs/Rux0cOTUxEmgGhAcxOXvQWjO46sAfT7hZOEAAEYS09+s
         jnTk1tP8y9qvo0nZEhAtggJT/UaihS7LjtVbKd3OKA+Jk3Om9o1YhHVL29dgfJ07XkE5
         LBsGdyBpOQAJiPH2xrw3ZSQ9feibe73OxnBY2wKlzJ6kQYWctqhEnD0OnB1XnZd+QOzF
         8jpjo604mcyKJqWmyAr1fvf94I47c86RbtRkexL/M+jRtdGoIwVM3cyB6jeh8NkhTTzS
         lVDA==
X-Forwarded-Encrypted: i=1; AKwUvBydjOC1Py+b0noxIw0qmHCGHAcq5kIL4yQZM2Ot+93QhBnEkY9erV1dmyARrA5nXwHSW2s32pf1StaRPSw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hfvkcmsx/tj+S+VslDrbB5S/a5e5L+RenZcJGR3pBLLqutDmN
	puUt6F0cxnup5Eo+Vr2oSBueb0lXUrLxMA3ijDioFbWZA5sZpQ/78rPocRNAfNXPIw==
X-Gm-Gg: AYBFou1IGieAG1M30gM46TquDWeCCyVTjSx6wtY7z6bi/GZ4fjlTY4B4I9wXt6oCJbF
	uPmQ09Xwg/CB91O78losQPJ8cdWBK/tsvFPaqCG8iCh28U8vncb4q5Gvhk7z/5IoknXqWDsjViM
	uE5Yw5PmmO+i9dYGHODjraSkeuv50TV/5tpfUVVGKWvgv6v+IlKuk3lgxYWj8OtJ0TbocyuhU3T
	MceL6KLPbnI2HkBrM4zMfsIBiqkGR1famgG6jKMnaH6OIoyzWOiCg0K2/ba6lsS33M3agOJ0Hj0
	T0dFc0jhARXtrNPdyGSw6qv9uWfNp5sipczrarkm7YQLKMdstb+S8+6rid4Q9bSlYNANdNrX251
	/PL5Q3IjfvuBoPbF+KqFYLC37hju/G8iBhNyQx+bIIY/WNMfS5SWukNPIX08Zbaui1s3hJddsWJ
	MB/zXm8LShpqZUOsa8u/D1x3hcqGn1JLldwo/m9kAqBc7OIUOxgvBkRozp91GSwj+oVyuQWtlZ9
	kQMOoOI3r/iPRWW2YW9vCRspUAmyH7VJ8h4TU84C6BOEnrDKndjxS8GBoAndCQHSdOfi9wKiS29
	1gB7FLwk9ruKJAwFhFzf6kUi/oz7ntMrFhDoznlc2PV1xAuk/gOSjS5tdQxw7Q==
X-Received: by 2002:a05:693c:83dc:10b0:365:d42a:f415 with SMTP id 5a478bee46e88-36a423454b2mr22770760eec.12.1793722347185;
        Tue, 03 Nov 2026 08:12:27 -0800 (PST)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm47214021eec.6.2026.11.03.08.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:12:26 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH v5 0/9] Add Greybus Sotfsvc and UART Node drivers
Date: Tue, 03 Nov 2026 21:41:47 +0530
Message-Id: <20261103-gb-uart-transport-v5-0-f8e326d6561f@beagleboard.org>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOTWrDMBAF4KsEraugGUmxmlXuEboY/dgRFCtIj
 kkIvntlU0og6m7ewPtmnqyEHENhx92T5TDHEtNYg/7YMXehcQg8+poZCjwIA4IPlt8oT3zKNJZ
 rqtMnau0PWndOOVZ71xz6eN/M81fNl1imlB/biRnW7a+GLW0GLjga9ASKbGe7kw00fAebKPt9y
 gNbzRlfna7lYHVISGuh17310HbknwMCZMuR1THgBRkCcv0//6gXB6HlqOo4KYwLBsEr/e4sy/I
 DuCidCpABAAA=
X-Change-ID: 20260810-gb-uart-transport-9255d6557c4c
To: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com, 
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Markus Probst <markus.probst@posteo.de>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10414;
 i=ayush@beagleboard.org; h=from:subject:message-id;
 bh=Un+JeaoO5nO0A9iuuQpHYPf5wnPRYStXrfDeLtewjmA=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBq6gffJCf0b/EqQOpxLrbuuTe3NhD7a1SSw7JvZ
 lw8kq9Iq+6JAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCauoH3wAKCRAFzvXHieVa
 dD67EACKfk6XiXD58HxSF+y6CsNtxvs0y1I27VMtCmCE+voKUv5LnKyONvWAIAKKqkdmbZ1WnLE
 Wz2je7a/Irzs2cXqE0uquRPdK5UchkX/HXZrx+IvP0EckD+0DeefWut/p6vhGPovZKwLyUoPXrr
 7sVY4ZBS/PxYlQXOVINkmHZ9ByRVWpGbVDDKPN5Ka5TRl0YDQoEiqMOaRFwNKec2An+Yup5L0mo
 Fg9l0SoxLJJLz92qMr+D0mf3nY8bMpRW6GYvgt1Q2Y44SbWqwcO0PtUwhIZPRANzl9O7gsdbWd4
 80TDAt93fhPxge/4z91HyaU5pnspPmSRT3qYb3+rNdOpUpTyt5Ce+cyWtcLnXqMiYkudWqk6wml
 IUA3bSgncoHNlxR7tFIHWtb0H+1m5UVzb8lg2PG/uQKNT/3LtWfBh8PW8iKqkB1Fr1x/jRPb8tl
 0mgdlc+H359s8ECRoz7VD9QKoy5kK8osSZd+KwtgACy6b2czAK4HUZ9zT3KD9aEy1n0vBjSDcRW
 UkETlXL3OM4CLQSZa7anyy79QuslTLPf9R6c5LGKdS/aG0rEwK91GH/878SbRNtEkM8rDQaTah0
 iSLlAe5Xr/7QvJYvJxtnngfhgFMMVicASgt5wkxyOubDiEmeQssLeUoX5nNbkql2SXZwE1eT6Dp
 +UQVJhZLgJNbnWA==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

A Greybus network needs an SVC (Supervisory Controller) to bring
interfaces up, assign device IDs and connect CPorts to the AP. On a
UniPro network the SVC is a real entity on the bus. On transports that
merely carry Greybus messages - a UART, an I2C bus, a network link -
nothing on the wire plays that role, so the SVC has to be emulated
somewhere: in a user-space bridge (gbridge), in coprocessor firmware
(cc1352p7 in gb-beagleplay), or open-coded inside the host driver itself.

This series moves the emulation into the kernel and makes it shared.
This was discussed in a prior RFC as well [2], but to keep things short,
removing the need for an external SVC greatly simplifies the greybus
network setup when nodes are directly connected over common transports
such as UART, I2C etc.

    gb-uart-node          gb-softsvc              greybus core
   (transport, serdev) <-> (SVC + host device) <-> (bundles, protocols)
        NodeOps            module_insert()
     submit_message()      module_remove()

gb-softsvc registers itself as a Greybus host device and answers the
SVC-side operations the core expects during interface bring-up and
teardown. A host driver implements the NodeOps trait to push data
towards its node, calls module_insert() to announce a new node,
submit_message() to hand incoming Greybus messages back to the core,
and module_remove() on disconnect.

The first user is gb-uart-node, a driver for Greybus nodes attached over
a plain serial port. Framing is HDLC, with a one-byte address (0x01 for
Greybus) and control byte, followed by the 16-bit CPort ID and the
Greybus message. No SVC firmware is required on the far end, so the node
can be a bare microcontroller speaking Greybus - a BeagleConnect Freedom
over its serial link, in this case. The testing is performed with
greybus-zephyr [0] implementation.

Both drivers are written in Rust, which is why the middle of the series
is abstractions rather than drivers. Only the APIs these two drivers
need are covered: protocols.rs abstracts the SVC-facing parts of
greybus_protocols.h, and types such as Greybus Interface do not
implement AlwaysRefCounted yet. The intent is to grow this as more Rust
host drivers appear rather than to abstract the whole subsystem up
front.

Patches 1 and 2 are small C-side preparations to the Greybus core:
exporting gb_connection_get()/gb_connection_put() and adding
gb_connection_hd_find_by_intf(), a lookup by remote interface and CPort
id for callers that only know the far end of a connection. Patch 3 adds
a CRC-CCITT abstraction, needed for HDLC frame checks. Patch 4 adds the
Greybus abstractions, patches 5 and 6 the two drivers, and patch 7 the
device tree binding for BeagleConnect Freedom.

Open questions
***************

- gb-uart-node imports types from gb-softsvc, so the series carries the
  Rust-to-Rust cross-module calling setup from nova-core [1]:
  gb_softsvc_exports.c plus the Makefile plumbing that emits crate
  metadata and generates the export list. This is a workaround for the
  build system not supporting Rust cross-module dependencies natively,
  and it should go away once that lands.

- Connection create/destroy and interface activate/resume in gb-softsvc
  currently just acknowledge the request. Callbacks into NodeOps can be
  added when a transport actually needs to act on them; I did not want
  to invent an interface without a user.

- Zerocopy is currently not being used in grebeybus/protocols.rs. They
  cannot be derived yet since types generated by bindgen do not have
  them, and it seems explicitly forbindden to manually impl the traits.
  So using old traits from transmute.

- The bindings are supposed to be created for actual device, but any MCU
  that supports Zephyr, can run the greybus-zephyr firmware with UART
  transport. So not sure if adding a beagle,beagleconnect-freedom
  compatible is the correct choice here.

- The individual patches can be spun off into independent patch series
  if required. The reason for this single patch series is to provide a
  complete picture of usage.

- Since gb-softsvc currently is not being used from a C driver, no C API
  is provided. However, if required, it can be added.

- Writing to UART from gb-uart-node is currently a bit broken. I am not
  quite sure what the safe way is to go from a non-bound device to a
  bound device. Any suggestions on this front are welcome.

- I am not sure if Rust abstractions should have a seperate entry in
  MAINTAINERS with me as the maintainer, or if they should just be added
  to the respective subsystem entries. As mentioned by Miguel Ojeda
  [3], this is upto greybus maintainers. So waiting on their inputs. I
  am available to be maintainer for the Rust abstractions for greybus
  if required.

[0]: https://github.com/beagleboard/greybus-zephyr
[1]: https://lore.kernel.org/all/20260622-nova-exports-v5-0-6191773fc977@nvidia.com/
[2]: https://lore.kernel.org/all/ecca8eb2-8e5a-4770-bcf6-3fb49773088b@beagleboard.org/
[3]: https://lore.kernel.org/all/CANiq72mA6pTmPJUk8g7y3Z=wetFMXdzHLiPEPChpY4OTg3OHiw@mail.gmail.com/

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
Changes in v5:
- Remove AlwaysRefCounted impl from Interface. No longer required.
- Fix invalid comments.
- Fix interface drop in spinlock.
- Impl AlwaysRefCounted for hd::Device only in normal context.
- Match the bus device struct defination in device.rs docs.
- Return GB_OP_PROTOCOL_BAD instead of ENOTSUP when encountering an
  unknown message.
- Fix possible race condition in SVC module removed. Flagged by
  sashiko-bot. Involved, ensuring that operation_cancel cannot drop an
  in-flight message.
- Fix timer leak in a greybus operation.
- Check write_all return.
- Return E2BIG when frame lenght is exceeded in uart node driver.
- Link to v4: https://lore.kernel.org/r/20261021-gb-uart-transport-v4-0-c308ce821d45@beagleboard.org

Changes in v4:
- Remove gb_uard_node::GbUartNode::unbind. Suggested by Markus Probst,
  since write is still valid after unbind.
- Add inline attribute where suggested.
- Remove patch 1. No longer required with modifications to the old patch
  2.
- Increse hdlc max buffer size to 512 bytes.
- Send module_removed request before removing from map.
- Also do not hold lock across interface drop.
- Link to v3: https://lore.kernel.org/r/20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org

Changes in v3:
- Fix incorrect email in MAINTAINERS.
- Make CONFIG_RUST_GREYBUS_ABSTRACTIONS depend on sysfs like
  CONFIG_GREYBUS.
- Fix cleanup in hd::Registration::new in case of errors.
- Fix comments.
- Fix Msg AsBytes impl as suggested by sashiko-bot.
- Use SpinLock for intf_map. This should be fine since we need locking
  only for getting the interface. We do not hold locks across operations.
- Properly drop message in case of buffer overflow in gb_uart_node.
- Link to v2: https://lore.kernel.org/r/20260827-gb-uart-transport-v2-0-a03bb1f5fbd1@beagleboard.org

Changes in v2:
- Fix possible null pointer dereference in
  gb_connection_hd_find_by_intf. Flagged by sashiko-bot.
- Remove prompt CONFIG_RUST_CRC_CCITT_ABSTRACTIONS Kconfig symbol.
- Add CONFIG_RUST_GREYBUS_ABSTRACTIONS to ensure that greybus is
  built-in for rust abstractions to work.
- Use gfp_mask in message_send callback.
- Only provide a Message reference in message_cancel callback.
- Add invariant comment for Registration.
- Call Registration->add directly in new, before constructing
  Registration.
- Add Send and Sync bounds to T in Registration<T>
- Set endo_id as 0. Is not used anywhere.
- Fix module_insert intf_count. Was hardcoded to 1 by mistake. Flagged by
  sashiko-bot.
- Check for empty intfs slice in Module::new.
- Remove module in serdev::Driver::unbind instead of on drop.
- Make gb_uart_node write atomic. Using temp buffer to build frame.
- Fix import style.
- Reorder beagleconnect-freedom dtbinding patch to be before gb_uart_node.
- Add vbat-supply and reg properties to beagleconnect-freedom dtbinding.
- Reference spi-peripheral-props in beagleconnect-freedom dtbinding.
- Link to v1: https://lore.kernel.org/r/20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org

---
Ayush Singh (9):
      greybus: operation: keep request active across message_send
      greybus: svc: add gb_svc_flush()
      greybus: operation: arm request timeout before sending
      greybus: connection: Add greybus_data_rcvd_by_intf()
      rust: crc_ccitt: add CRC-CCITT abstraction
      rust: kernel: Add greybus abstractions
      drivers: greybus: Add software SVC implementation
      dt-bindings: beagle: Add BeagleConnect Freedom
      greybus: Add Rust UART node driver

 .../beagle/beagle,beagleconnect-freedom.yaml       |  62 +++
 MAINTAINERS                                        |  15 +
 drivers/greybus/.gitignore                         |   1 +
 drivers/greybus/Kconfig                            |  35 ++
 drivers/greybus/Makefile                           |  50 ++
 drivers/greybus/connection.c                       |  47 ++
 drivers/greybus/gb_softsvc.rs                      | 533 +++++++++++++++++++++
 drivers/greybus/gb_softsvc_exports.c               |  15 +
 drivers/greybus/gb_uart_node.rs                    | 270 +++++++++++
 drivers/greybus/operation.c                        |  29 +-
 drivers/greybus/svc.c                              |  14 +
 include/linux/greybus/connection.h                 |   2 +
 include/linux/greybus/svc.h                        |   1 +
 lib/crc/Kconfig                                    |   7 +
 rust/bindings/bindings_helper.h                    |   2 +
 rust/kernel/alloc.rs                               |   6 +
 rust/kernel/crc_ccitt.rs                           |  26 +
 rust/kernel/greybus/hd.rs                          | 391 +++++++++++++++
 rust/kernel/greybus/mod.rs                         | 200 ++++++++
 rust/kernel/greybus/protocols.rs                   | 445 +++++++++++++++++
 rust/kernel/lib.rs                                 |   4 +
 21 files changed, 2152 insertions(+), 3 deletions(-)
---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20260810-gb-uart-transport-9255d6557c4c

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

