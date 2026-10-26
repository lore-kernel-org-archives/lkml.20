Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793054200;
	b=32jelEO/jLboOpFo9Y7/mGkM1o9AsPhPqjCJduvvFx8TXnT8fZ1lka1VeP47cXAeFr+W
	 JCm2Jc7Hr4haUwYetpQmHZ6BbNNF+J2iL/D0xCM5Se5aBOUH1Z701g6ryS5yNKvlg0qLL
	 ugoY9sGaatbzlBrg+CHZ/CCJP3o0MVUw3ZpyhlKMA/I5m6uyCd1firgWz8MYNBB6Nyu91
	 yMkuvvHCv1Ljj4S3D9UhPyJv4lGQ2kZcJclBe5HxN2DMaXoGpYDCHAbtl2u3dKSyb2zAa
	 K8vEXEIBIRemw7ZL5ehKqJSW61sB8ixlTEQJSdf3ED+AJ0XlLZP+8z2WYHGsrHlXPVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054200;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Wn5yj3w2Uv5vK8FWfbXAsWF4r2hTF/x/H/S61mKKRJI=;
	b=zH/ZXpMn1AAq4eDSaNwvdxl5Oa5W1xvigVhQf9HYwOYYgDf1Px58b1rZf5LtUINqzRZ4
	 LUmaPcZ8HqHtbE6zkEQzlf07IwKDf+o6phEIl8v3/v/449YVf9qRhDPQyPtXKO+v+sVv0
	 o0N5zF3KsEV2+tkopy8jsXztwUJbU5wZXiNHgvhqyzM4Q/BD0xAatar6E9T/t7TK83gN2
	 FTG+GKll1TO5hDCLbOpPHotED0Tdjous0xazCKkvgOizDI6TpZOpp+AFXxGJzfCUr2XpZ
	 /H2c6wCgMuT72Jys8nJatguths8x+8RCqBIvfhom//gxkWZxd8IS+bhjnbny7ZQAS5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=B5WDnn6n;
	arc=none smtp.remote-ip=79.135.106.121
Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975AA606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 975AA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=B5WDnn6n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793054196; x=1793313396;
	bh=Wn5yj3w2Uv5vK8FWfbXAsWF4r2hTF/x/H/S61mKKRJI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=B5WDnn6nf5Q223Sx0Bir2N77PDUpzknBEZoCtNSCpyEc3KhkZ2zpqpdAec51vwtG5
	 I2TIjp3x+Bdf3CqHPzvHvGxAdZjqMexOnhf2/Uf6fyqc8WqKf/RzjtCxJX37U0gW/C
	 /z6KyD9KvR8iIxWmOVT1ArURhs+Ee9vnPj/AMXMDBmhHLCKjY37gOuQZwsPCK8mtCl
	 4nQcTlqXFeZsKy00l28OvCgmk1hlLoH69zWgYGv7doD/OnKo0PQJn3X7R7LJ66ASjd
	 ivKEYfjFNd7YTBdnLCUzeI9th39VpFGW/VmlsMU4qjsm3+ylKRdwvXBmkFQwie6de5
	 8x9LGoYxHPgzg==
Date: Mon, 26 Oct 2026 22:36:31 +0000
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Clemens Ladisch <clemens@ladisch.de>
From: Sinan Turunc <enscrpt@pm.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ALSA: usb-audio, ua101: oversized packet copies overrun PCM ring buffers
Message-ID: <20261026223543.620-1-enscrpt@pm.me>
Feedback-ID: 48393780:user:proton
X-Pm-Message-ID: ab7ad262e3ee8e2e29a45613e4536fb55d6f1e77
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

v1 went out under my handle, x8svc. v2 changes only the From and
Signed-off-by lines, which now carry my real name, as Takashi asked:
https://lore.kernel.org/all/87tsm86fzy.wl-tiwai@suse.de/
No code change.

I found ring-buffer overruns in snd-usb-audio and snd-ua101 when the
amount of data copied from or to an isochronous transfer exceeds the
ALSA PCM buffer size. The copy paths use a two-part memcpy() and a
position update that handle only one wrap, which is not enough when a
single packet is larger than the whole buffer.

I reproduced the overruns under KASAN on 7.3-rc7 (2f2f7eeef8b0) in
snd-usb-audio and snd-ua101, for capture and playback. The two patches
that follow apply to and build on current mainline (c03c1a14507d). I
found similar code in snd-usb-line6, snd-usb-usx2y and cx231xx-audio,
and reproduced them on 7.3-rc7. em28xx-audio has the same shape. I
booted it, and KASAN reported nothing. By reading, the
same shape is in 5.15.y, 6.1.y, 6.6.y, 6.12.y, 6.18.y and 7.2.y. I did
not boot those branches. 5.10.y has older code, which I have not
checked.

The reproducer is available to maintainers on request.

snd-usb-audio (sound/usb/pcm.c)
-------------------------------

retire_capture_urb() and copy_to_urb(), called from
prepare_playback_urb(), copy data across the ALSA ring buffer with a
two-part memcpy() and update the position with a single wrap:

    subs->hwptr_done +=3D bytes;
    if (subs->hwptr_done >=3D subs->buffer_bytes)
            subs->hwptr_done -=3D subs->buffer_bytes;

    if (oldptr + bytes > subs->buffer_bytes) {
            unsigned int bytes1 =3D subs->buffer_bytes - oldptr;
            memcpy(runtime->dma_area + oldptr, cp, bytes1);
            memcpy(runtime->dma_area, cp + bytes1, bytes - bytes1);
    }

Nothing in the path guarantees bytes <=3D buffer_bytes. The device sets
the packet size and the PCM client sets the buffer size.
setup_hw_info() permits 8 kHz mono U8 with a 128-byte buffer (64-byte
periods, two periods), and a full-speed endpoint can send 1023-byte
packets.

The first oversized capture packet already overruns the logical PCM
buffer: with oldptr =3D 0, the two-part copy writes 128 bytes and then
another 895 bytes at the start of the 128-byte buffer. It also leaves
hwptr_done at 895 (1023 - 128), beyond buffer_bytes. On the next
packet, bytes1 =3D 128 - 895 wraps to 4294966529, and memcpy() runs past
the URB buffer and the vmalloc'd DMA buffer.

For playback, copy_to_urb() has the same single-wrap assumption, and
the reproducer reaches an out-of-bounds read there as well.

KASAN reports (7.3-rc7, x86_64):

Capture:

  snd-usb-audio 2-1:1.0: invalid position: , pos =3D 895, buffer size =3D 1=
28, period size =3D 64
  BUG: KASAN: slab-out-of-bounds in retire_capture_urb+0x251/0x870
  Read of size 4294966529 at addr ffff88800c1e2800 by task vhci_rx/82
  ...
   retire_capture_urb+0x251/0x870
   snd_complete_urb
   __usb_hcd_giveback_urb
   vhci_rx_loop

Playback:

  BUG: KASAN: vmalloc-out-of-bounds in copy_to_urb.isra.0+0x188/0x430
  Read of size 4294966529 at addr ffffc9000004537f by task vhci_rx/79
  ...
   prepare_playback_urb+0x98a/0x1fc0
  The buggy address belongs to a 1-page vmalloc region starting at
  0xffffc90000045000 allocated at __snd_dma_alloc_pages

On 6.19-rc3 the same reproducer faults in memcpy() from
retire_capture_urb() without KASAN (RDX =3D 0xfffffd01, the wrapped
bytes1).

The USB/IP server never reports an actual_length larger than the
requested packet: actual_length equals the URB's iso_frame_desc length
and curpacksize. I reproduced this through USB/IP only. I have not
tested a physical device or a physical host controller.

The local PCM client only needs permission to open the PCM device. My
reproducer runs as an unprivileged user in the audio group. I also
tested Fedora 42's PipeWire 1.4.11 with WirePlumber 0.5.14 and
PulseAudio 17.0 against the same USB/IP device:

- In the tested PipeWire configuration, the driver selects its maximum
  buffer, capped at two seconds (16000 bytes for this stream).
  Full-speed 1023-byte and high-speed 3072-byte packets fit. With a
  super-speed device advertising wBytesPerInterval 49152, pw-record
  hits retire_capture_urb() with a 33152-byte write (49152 - 16000)
  and then faults at the vmalloc guard page. pw-play hits copy_to_urb()
  with a 33152-byte read on PipeWire's data-loop.0 thread, and the
  machine soft-locks.
- PulseAudio 17.0 inside this VM turns timer-based scheduling off by
  itself. The measured buffer is four 25 ms fragments, 799 bytes, and
  a full-speed 1023-byte capture packet reproduces the
  retire_capture_urb() report. I did not measure timer-based scheduling
  left on. The PulseAudio source uses a 2 second buffer in that case.

A client with permission to open the PCM device directly can trigger
the full- and high-speed cases by selecting a sufficiently small
buffer. The super-speed case reproduced in the tested PipeWire
configuration with an ordinary recording or playback application when
the emulated device was selected as the default device.

Reproducer
----------

I used USB/IP because I could not exercise this isochronous transfer
path with dummy_hcd and raw-gadget. The reproducer is available to
maintainers on request:

- usbip-server.py emulates a UAC1 microphone or, with --mode playback,
  a speaker. It advertises a one-channel, 8-bit, 8000 Hz Type I stream
  and a full-speed isochronous endpoint with wMaxPacketSize 1023 and
  bmAttributes 0x80 (MaxPacketsOnly). Each packet is 1023 bytes.
- attach.c imports the device and attaches the socket to vhci-hcd
  (CONFIG_USBIP_VHCI_HCD).
- client.c opens the PCM device with U8, one channel, 8000 Hz,
  period_size 64 and two periods (buffer_bytes 128), sets
  stop_threshold to LONG_MAX, and starts the stream. For playback it
  first writes 128 bytes.

The fault occurs within a second of starting the stream in my tests.

Patch 1
-------

The snd-usb-audio patch bounds the capture packet copy by the PCM
buffer size and stops prepare_playback_urb() from scheduling more data
than the buffer can hold.

I tested it on 7.3-rc7 with the same reproducer for 30 seconds per
mode. KASAN reported nothing. Capture kept streaming and logged the
ratelimited truncation warning. Playback entered XRUN at once because
the buffer cannot hold a single packet, which is the safe failure for
such a device. With PipeWire and a super-speed device, capture
truncates the packet with the same warning and the stream keeps
running. I did not repeat the patched playback run with PipeWire.

Patch 2
-------

In snd-ua101 (sound/usb/misc/ua101.c), copy_capture_data() takes the
frame count from actual_length, and copy_playback_data() takes it from
the capture packets through rate_feedback. Both split the copy at the
end of the ring buffer and wrap the position once.

set_stream_hw() permits an 18-frame buffer: periods_min is 2 and the
period can be 9 frames. A 672-byte packet of one-channel, 24-bit audio
holds 224 frames. After the first packet the position is 206, which is
188 frames past the 18-frame buffer (224 - 18). On the next packet the
single-wrap calculation underflows.

KASAN reports in my tests:

  snd-ua101 2-1:1.0: invalid position: , pos =3D 206, buffer size =3D 18, p=
eriod size =3D 9
  BUG: KASAN: slab-out-of-bounds in capture_urb_complete+0x9eb/0xcb0
  Read of size 4294966732 at addr ffff88800d73e7e0 by task vhci_rx/81

  BUG: KASAN: vmalloc-out-of-bounds in playback_work+0x789/0xac0
  Read of size 4294966732 at addr ffffc9000002626a by task kworker/0:1H/80

The reproducer uses the same USB/IP server with --device ua101 to
present a UA-101 interface layout, and a client using S24_3LE, 44100
Hz, period_size 9 and one channel.

The patch clamps the capture copy to the buffer size. On playback it
copies at most one buffer and fills the rest of the packet with
silence, so the URB length, the delay accounting and the data sent stay
consistent. I first tried shortening the playback packet instead, but
that makes the URB's declared length disagree with its buffer and
USB/IP drops the device, so I kept the length. With the patch, capture
and playback each ran for 30 seconds without a KASAN report and the
streams kept advancing.

The period accounting still subtracts one period at a time, so a
packet spanning several periods of a tiny buffer leaves period_pos
above one period until later calls drain it. I did not see this cause
a problem in the runs, but I have not analysed it further and would
welcome your view.

Other drivers
--------------

snd-usb-line6, capture, on 7.3-rc7. A GuitarPort device sent 1024-byte
packets into a 128-byte buffer (S16_LE, 44100 Hz, 16 frames, 2 periods,
2 channels). ALSA logged:

  snd_usb_toneport 2-1:1.0: invalid position: , pos =3D 224, buffer size =
=3D 32, period size =3D 16

KASAN reported nothing. The ring is a whole page, so the extra bytes of
the first copy stay inside that page. The driver then stopped copying
and logged "driver bug: len".

snd-usb-usx2y, capture, on the same tree. After the hwdep firmware
load, a US-122 device sent 1024-byte packets into a 512-byte buffer
(S16_LE, 44100 Hz, 64 frames, 2 periods, 2 channels). KASAN reported:

  BUG: KASAN: out-of-bounds in i_usx2y_urb_complete+0x1285/0x1ac0
  Read of size 18446744073709551104 at addr ffff88800e448800 by task vhci_r=
x/83

That read size is the single-wrap length once the position has passed
the buffer. These two patches do not change line6, usx2y, cx231xx
or em28xx.

cx231xx-audio, capture, on the same tree. A Pixelview Xcapture device
sent 1024-byte packets into a 128-byte buffer (S16_LE, 48000 Hz, 16
frames, 2 periods, 2 channels). KASAN reported:

  BUG: KASAN: use-after-free in cx231xx_audio_isocirq+0x2c7/0x780
  Read of size 4294966528 at addr ffff88800e8e0400 by task vhci_rx/82

ALSA logged pos =3D 224, buffer size =3D 32, period size =3D 16. That
position is one 256-frame packet minus the 32-frame buffer. The read
size is the single-wrap length once the position has passed the buffer.

em28xx-audio, capture, on the same tree. An em2860 device sent
3072-byte packets into a 24576-byte buffer (S16_LE, 48000 Hz, 3072
frames, 2 periods, 2 channels). The endpoint was 0x83, with 64 packets
per URB. Capture ran for 30 seconds. KASAN reported nothing.
period_bytes_min is 11059 and periods_min is 2, so the smallest buffer
is 22118 bytes. em28xx_audio_ep_packet_size() caps a high-speed
endpoint at 8188 bytes, so one packet cannot pass that buffer.

Process
-------

I understand this to fall under the regular-bug handling in
Documentation/process/threat-model.rst, because reproduction uses an
emulated USB device, so I am sending it to the subsystem list with the
proposed fixes. An AI tool helped with the analysis and the patches.
I reviewed and tested them myself.

Thanks,
Sinan Turunc

