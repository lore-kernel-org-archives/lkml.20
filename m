Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651920;
	b=mATgwnItz1YDABtwQCZe40SUqVF92a48beyNqLMgtDfTYsxndv3Ow9JUwdtZ2G7BvsIx
	 COIAF6fhQut/rUqXtGcnWWilMIZGK3beO8oP4KdwRqxwJnvgqLTC1p9Klpx7NmvSsu5FR
	 sxjsIWhQgXXJNs+1wya+TRrO/RpzagtellqPA1lVQlYjDwukc5PKGTC0GMxhkrfXOZArR
	 fUBRpe89qwuXSZvCcxO267Ii6pg4lTv/1MphplGfQudqnaJtJTUsVLA4E2QVVavzgpsFe
	 WOyUpRz1x5j0IyDkrwx1QnxeYUqJPyYngk0FyD7cCZpr5q+m0FWP/3EBlsKIPuVxAnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651920;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=Fxx+f+pmoy2K8FG2VJY88utQ88NglXhrdhzsq7ogqNI=;
	b=sCrJyrAX/zoAlqKEPlA9Tuygxh6UCThRQamuK0s4dgswuP9Kr6HBXQYqYwnxoZDH9G8k
	 dHbANFXwUZZQHJyUZLubihRlr2ABQSQY7OFObChqewCNzYhF8a0W/R48k+ugy4jkC6ZdD
	 bakxt/t2DEDgHA36yOHFfqSSJvAjIL7TwyTsAt5LMKFiXdAYQzKkDfy2fpKEq1KuNkfmn
	 EXAv75I2q6M/KEIDEhysbwMqMhrQ2pSmSlLYIvlL1+Oqo54uTKaoI0ppkie8rSOsJGOUN
	 RG4X5UqD8VyoM5AGsN/NQk+Pcm7tl/CmKPOuHRaeQAH7W6eS8lELyxBtuHMdelYbNPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=m9dCyeNL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B04606A319;
	Thu, 22 Oct 2026 06:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=m9dCyeNL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A741F000C1;
	Thu, 22 Oct 2026 06:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792651919;
	bh=Fxx+f+pmoy2K8FG2VJY88utQ88NglXhrdhzsq7ogqNI=;
	h=Date:From:To:Subject;
	b=m9dCyeNL7g2ENWmYszzuYPvV+joCCX/sqqjjfXO/vl4+IQzoof0w5OVqmDmYnv9m3
	 DhXqjFxoIxnkFniFVk5qplbjL9IoQJ2+zzx4DP9uHdi00bpKvy0/TfLxUkcVR8f4Hb
	 qTgvk5EjWYLEj9tdxqwYjL4IH0vklwEpMdIOLrsw=
Date: Thu, 22 Oct 2026 08:51:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: usbutils 020 release
Message-ID: <atmyfUVyCnr5WnJh@kroah.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j+14c5xRj1NLxu8m"
Content-Disposition: inline

--j+14c5xRj1NLxu8m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Another year later, so it's time for a new usbutils release.

I'd like to announce the usbutils 020 release.

Lots of fuzzing fixes in this release for 'bad' devices, now that people
are starting to worry more about these types of USB devices.  I'm not
guaranteeing that all "malformed" USB devices will now not crash the
codebase, but we should be a better off than in the past.  As usbutils
is NOT something that is a "security boundry" this really isn't a
problem in real life, but it is nice to harden up the USB descriptor
parser a lot.  Thanks to lots of OS fuzzing rounds, we should be better
off here.  There's also now a built in "test suite" that can help make
modifying the code a bit easier to verify that nothing obvious is
different from the system-installed version of the tools (unless you are
wanting there to be a change, and in that case, you can ignore the test
failures.)

Other than that, there's some new support for a newer USB spec, and the
constant churn of "where is the usb ids file located now?" work to
handle more distros and systems, and some cleanups of 'lsusb -t' to make
it more obvious which device is which at times.

Full details of the changes in this are found below in the shortlog.

Tarballs can be found on kernel.org here:
	https://www.kernel.org/pub/linux/utils/usb/usbutils/

Or you can pull from the following git locations as well:
	https://git.sr.ht/~gregkh/usbutils
	https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usbutils.git
	https://github.com/gregkh/usbutils
	https://github.com/linux-usb/usbutils

thanks,

greg k-h

------------

usbutils 020
============

Armin Wolf (1):
      lsusb: Add support for FWStatus Capability decoding

Greg Kroah-Hartman (124):
      justfile: add 'make' target
      usb-spec.h: fix up spelling mistake for "Tone Enable" entry
      tests: vendor brat 0.10.1 as the test runner
      tests: compare built lsusb against the installed copy
      tests: lsusb -h: compare built against installed
      tests: lsusb -t: compare built against installed
      tests: lsusb -s: compare built against installed
      tests: lsusb -d: compare built against installed
      tests: lsusb -D: compare built against installed
      tests: usb-devices: compare built against installed
      tests: lsusb.py: compare built against installed
      tests: lsusb.py -h: compare built against installed
      tests: lsusb.py -i: compare built against installed
      tests: lsusb.py -I: compare built against installed
      tests: lsusb.py -u: compare built against installed
      tests: lsusb.py -U: compare built against installed
      tests: lsusb.py -c: compare built against installed
      tests: lsusb.py -C: compare built against installed tests:
      lsusb.py -e: compare built against installed
      tests: lsusb.py -w: compare built against installed
      tests: lsusb.py -f: compare built against installed
      justfile: add 'test' target
      desc-dump: fix operator precedence bug in bit-to-byte conversion
      usbmisc: fix NULL dereference on getcwd() failure in get_absolute_path()
      usbmisc: check malloc() return in get_dev_string_ascii()
      usbmisc: check malloc() return in usb_string_to_native()
      usbmisc: fix unbounded recursion and strncpy issues in readlink_recursive()
      names: replace sprintf() with snprintf() for modalias formatting
      lsusb-t: replace sprintf() with snprintf() in lanes_to_str()
      desc-dump: fix NULL pointer dereference for unknown audio terminal types
      desc-dump: fix integer underflow in get_array_entry_count()
      names: fix missing null termination in get_vendor_product_with_fallback()
      sysfs: fix buffer handling in read_sysfs_prop()
      sysfs: check initial snprintf() return value in get_sysfs_name()
      lsusb: fix out-of-bounds array access in dump_encryption_type()
      lsusb: fix out-of-bounds reads in video EXTENSION_UNIT descriptor parsing
      lsusb: fix unaligned memory access in dump_printer_device()
      lsusb: fix out-of-bounds read in video HEADER descriptor parsing
      lsusb: fix out-of-bounds read in HID report descriptor parsing
      lsusb: replace sprintf() with snprintf() in get_guid()
      lsusb: fix out-of-bounds read in MIDI streaming endpoint descriptor
      lsusb: fix out-of-bounds read in STILL_IMAGE_FRAME descriptor parsing
      lsusb-t: fix buffer handling in read_sysfs_file_string()
      lsusb: fix wrong variable in FORMAT_TYPE_II descriptor length calculation
      lsusb: fix out-of-bounds reads in video INPUT_HEADER and OUTPUT_HEADER
      lsusb: fix out-of-bounds reads in video PROCESSING_UNIT descriptor
      lsusb: fix out-of-bounds reads in video terminal and selector descriptors
      lsusb: fix undefined behavior in convert_le_u32() signed shift
      lsusb: fix OOB reads in UAC1 audio FORMAT_TYPE descriptor parsing
      lsusb: fix out-of-bounds read in SuperSpeedPlus capability descriptor
      lsusb: fix OOB reads in audio FORMAT_SPECIFIC descriptor parsing
      lsusb: fix out-of-bounds reads in IPP printer descriptor parsing
      lsusb: add missing length checks in dump_wire_adapter and dump_rc_interface
      lsusb: add missing length checks in dump_security and dump_encryption_type
      lsusb: fix OOB read in dump_dfu_interface on short descriptors
      lsusb: add missing length check in dump_association()
      lsusb: fix out-of-bounds reads in dump_hid_device() on short descriptors
      lsusb: fix OOB reads in UAC2 FORMAT_TYPE descriptor parsing
      lsusb: fix OOB reads in MIDI HEADER and MIDI_IN_JACK descriptor parsing
      lsusb: fix OOB read in dump_videocontrol_interrupt_endpoint()
      lsusb: fix OOB reads in video streaming format descriptors
      lsusb: fix OOB reads in video FRAME descriptor parsing
      lsusb: fix remaining OOB read in MIDI_OUT_JACK initial fields
      lsusb: fix remaining OOB reads in video descriptor warn-and-continue paths
      lsusb: fix OOB reads in video INPUT_HEADER and OUTPUT_HEADER data loops
      lsusb: fix OOB read in STILL_IMAGE_FRAME compression pattern loop
      lsusb: fix OOB read in FORMAT_MPEG2TS descriptor on short descriptors
      lsusb: zero hub descriptor buffer to prevent reading uninitialized data
      lsusb: fix OOB read in FORMAT_STREAM_BASED descriptor parsing
      lsusb: fix unsigned integer underflow in dump_bytes calls for short descriptors
      lsusb: fix wrong byte printed for CCID bClassEnvelope
      lsusb: bounds-check MIDI ELEMENT bNrInputPins/bElCapsSize against bLength
      lsusb: bounds-check UVC INPUT_TERMINAL bControlSize against bLength
      lsusb.py: strip control characters from device-supplied sysfs strings
      usbreset: refuse ambiguous selectors that match more than one device
      usbmisc, usb-devices: strip control characters from device-supplied strings
      lsusb: don't loop forever in find_otg() on a zero-bLength sub-descriptor
      desc-defs: fix off-by-one in UAC1 wFormatTag string lookup
      lsusb: bounds-check the BOS device-capability walk
      usbhid-dump: skip interfaces with bInterfaceNumber 0xff
      usb-devices: use printf instead of echo for device-supplied strings
      usb-devices: fix default case in class_decode()
      lsusb: strip control characters from the WebUSB landing-page URL
      lsusb: bound the report-fetch loop in dump_hid_device() too
      lsusb: bounds-check MIDI OUT_JACK bNrInputPins against bLength
      lsusb: bounds-check IPP printer capability walk against bLength
      desc-dump: bound get_value_from_field() against descriptor length
      sysfs: strip control characters from device-supplied string attributes
      lsusb, usbmisc, usbhid-dump: zero-init buffers passed to libusb control transfers
      lsusb: migrate the MIDIStreaming parsers onto the desc-dump table engine
      desc-dump: don't exit() on a device-supplied size_field value
      lsusb: return on short bLength in the class-specific descriptor dispatchers
      lsusb: check FORMAT_TYPE bLength before reading bFormatType
      lsusb: avoid undefined behaviour when assembling u32s from descriptor bytes
      lsusb: bound the extra[] dispatch loops by remaining size
      lsusb: fix wHubDelay decoding in the USB3 hub descriptor dump
      usbhid-dump: bound the HID-descriptor-extra walk by entry end, not start
      lsusb: fix two -D path-resolution edge cases in usbmisc.c
      lsusb: don't pass NULL into %s for unknown HID report/usage tags
      tests: brat: fix some spelling issues
      usbutils.spdx: update with new files added
      lsusb: add expected length message for video descriptor endpoint
      meson.build: turn off -Wno-unused-function
      lsusb: fix up parsing for older uvc devices
      tests: usbhid-dump: compare built against installed
      tests: usbhid-dump -h: compare built against installed
      tests: usbhid-dump -s: compare built against installed
      tests: usbhid-dump -d: compare built against installed
      tests: usbhid-dump -i: compare built against installed
      tests: usbhid-dump -e: compare built against installed
      tests: add lsusb argument-combination brat tests
      tests: add lsusb.py argument-combination brat tests
      tests: add lsusb -h/-V interaction test
      tests: add lsusb -t precedence test (-s/-d/-D ignored under -t)
      tests: add lsusb -D precedence test (-s/-d ignored under -D)
      tests: add lsusb -V precedence test
      tests: add lsusb -h precedence test
      tests: add lsusb repeated -s/-d/-D test
      tests: add lsusb -d :pid product-only filter test
      tests: add lsusb -D error-path tests
      tests: add lsusb -P/-p vestigial-option test
      tests: add lsusb -- end-of-options test
      test/lsusb-vv.brat: send errors to /dev/null
      lsusb-t: fall back to the sysfs vendor/product strings

Jefferson Kline (1):
      usbreset: return failure when device reset fails

John Whittington (1):
      lsusb.c: fix typo dwMaxiumumClock

MingHao Chen (1):
      lsusb.py: fix parse_usb_ids

MoJl4yH (1):
      lsusb: fix shift UB and truncated-item reads in HID report dump

dependabot[bot] (8):
      ci: bump github/codeql-action in the all-actions group
      ci: bump the all-actions group with 5 updates
      ci: bump the all-actions group across 1 directory with 4 updates
      ci: bump github/codeql-action in the all-actions group
      ci: bump the all-actions group with 2 updates
      ci: bump the all-actions group with 5 updates
      ci: bump the all-actions group with 5 updates
      ci: bump the all-actions group across 1 directory with 3 updates


--j+14c5xRj1NLxu8m
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEZH8oZUiU471FcZm+ONu9yGCSaT4FAmrZsn0ACgkQONu9yGCS
aT51HBAAjNx/XmP9uhXKHwxCBfPKMZyA/lJqjWuHnwSAtXs1bhIvYFuCo+DLO6Kn
v+P0cxotXME2HTUKFhi3slJQN2mCJBH4IwQluDG0jhBgwasB5a8pL9j9WjQLIAex
EEdW8l7SVsqyzB7Kdvwe9pCCCOVf+9jZaZku4mtMKde79A2v/TUOGpeRVxa/zMO6
4usSHaX3g+7cUUFzGe3LQRtTsx6+hYVZXpKiWvuuokSMFTUcwCQ+u78/03WOkAlV
6WL7okGrJOCAg9jws29KB4JtOxj32y9KE2ROKVW3Yj9O+A0g31xvW2tS0QddseCG
l2XcFNaaH5q/CQBv0La1acpEkYWxrfWfah1U9BOsl1KwMgpzZ1FqRgj9X2+PshnS
UI9tFhAAROIzyh7nEjzkV58pGQVliwyfV/k8uJKqgteqAOE4eu8HIzua9Cf2iXVz
pq0Ho4zpPEWIxX3yIya0VSB8bNzsaqdd7+Jri5ARZo0y61729+xAg0aYZYW5e9l2
qEfk9HchWfjW1KBjVHOP098Bj4Z4LzNmOS4pbjILc122KZQfuk61pwZGx9iGj9C8
M8oWkb/cgpqGVC202VLaWML7Lkjw5jdBajVcoDaM9IYs7MkDuSEWUFDLApVKM3mc
RkBuUuOmw7sCQzCkdUtxa13avFabYtj6ldP8ZPUDTCp8SUvjjy0=
=8dpi
-----END PGP SIGNATURE-----

--j+14c5xRj1NLxu8m--
