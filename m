Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C37D2EC0B0
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791604190; cv=pass; b=GuBTt8wzekQ12nL+ZDgmap10KmTCs3GSwaVLIP1pfZh55B/G6rCEYhBMfUvG5utEA1e5Zi9qlCwMNONaFPRz8k7iXPWPIL2e5mh5b4xiFsuWrjBNUGufl3E7K9rzkCLX+4z2gS08x0pENJvaWqQ/qOgKDL1ALWnH/XCjN7xhL0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791604190; c=relaxed/simple;
	bh=Y43WONo+4VxKTexJyA/SbV8/0+FPDtZyccn8oYlsnpA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=gfh1Wl+PGkCMQH2OUqUxbdaLW1IgpCCb8GYjpgWVXf6RZdxLk1u+u4NA07HmD9g6y8fL/iqclo26SIp1lo8JX9sL2iK8lS+v+mNtkB/5mTQxhBZGAS97MbkAtwgdh5VgLifMo1j9rUhZqDcUMBPU6BNKrRHy7D+xW62skAEI7Rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSE+d75/; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSE+d75/"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b16824c0fcso403907a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 20:49:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791604187; cv=none;
        d=google.com; s=arc-20260327;
        b=UJmmc1idVr0+fSndz0+IpUBpF+VXAbZiITnHCPNVBZgncf62cyQgiZPVe0Q/+jlbmg
         laHdR38Fw2ivjvm0or/O05Xu2XpyGJSJkE446veJoBvvkMwBsqNUZvEuKCvN8JR751vE
         XzvqnelUYJaDUindMxKNAs3YTutABIybldogFDKmQko4dfJcNjmf4WRMjuOU0FsQu6DK
         WLWsPElzCa71bYEQV5mE+04969W5kc6yGsV3pRJEZSVopnMQkLAu2t/rhrLnAysXuWTG
         nX6NTVsPccGtrok9vaj4Vq7q0a9/0DBqh8RlJjLlbLf5kuGYLALGwrFw1N8O17OSmygN
         gJQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=XvvY7S8HRq9XwIfKh5P7GJDm6dvfslD5dk/W3mmoMKU=;
        fh=J09fG0og6rs40rNHJLmT/WZpKQp47s1XqJdNaZ55dqA=;
        b=h9rDH77VwEsAMAx6Fnx8Ny6gzCUhZaOdy1RCGhJtCRD9HLXmwUUyfyCwAaryTUQGg6
         +yvxvZXTQA2AVblSHqsAtIQPha93oUJ2fsB1jmB4OnEbL6wXq65cHAQXVO9KowBxbpUM
         whQqqeFaf4e46p8qWAd8YPGpJriAuPBf5x8UpO7VJwOfV6TcSlHYciq2LMM4UCRw2G44
         VrUF693A0K7xur8ae0eOVDeMJkuHDxS+qld4OXYTq4s4UDWD4TXyuvTjEy0hDW6EVL8m
         gTjbiy3At0fBJ1udays4EPmW/bNP1f38DftAG5wQNYL/oJcXJ6HtzcPrZpcm0IzqbVBV
         YR8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791604187; x=1792208987; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XvvY7S8HRq9XwIfKh5P7GJDm6dvfslD5dk/W3mmoMKU=;
        b=nSE+d75/0C0gdZjls/5oB0tiz5QTiMu2WllTywoEt1UcSVlkeQ5miHv89ZQWqILbbZ
         DO9Xa+3cgnTd2hJj8JXgI6/zBEfSpYqAK1qhLyxtAaoQhviRsAa5nRUmPEISQvUWAJr2
         RcImKPrN4WbvPU2xn7JvFvi4dBIoq9Y10627wkysjlgiPlZ28kAd68K5huVfQOnCyVU/
         rlnbV32IvV2Shq8pEU0diJG911KBMZRXtHX1/B4cEg0YmA+zrisNwBHkzf0igisd6l22
         idkFsmxaxtjFassHe97yd37MPpYnpQGgA/niSLxFhVZIsiER5w4hKxzmG8c/FyeYpThu
         RKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791604187; x=1792208987;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XvvY7S8HRq9XwIfKh5P7GJDm6dvfslD5dk/W3mmoMKU=;
        b=s/oiSRxnOc+HHVpdCuwU6ZiU6W8qWxzOUhtJD/BLCvVRg9CcVSSjKI1GC2T1AUo/Wu
         D+38O6hDDd3eEJNY7GQIplBKWoSSUYuOrdxnP5QkhWjCjeU4lrhmb7+t/HCZwv6pxs3/
         z2gCVb73bH/uVTNByHLFvGSiBWUhm+3AqFQarvuu5VJ2AvDFrWpyUU4J8t3S57vzkSSP
         ElUuZCMZRbwRSR7jnwROIZd0PbP1nYiKkhQIryfh4t8JlIzAJuV11pW1esMRERjI3DhY
         BKe8E1EehbD+aLAEZsCsRX6mrw5YCep+fFaIqP8Fr/qqTLiP49WerIM46LrF/dI7lBLf
         NMIw==
X-Forwarded-Encrypted: i=1; AKwUvBzpVv3suPoNBxTa1n5rvre0NNmO5QXR5OEgdCO7tkwMf9qU7cAbDKFOKS4gyuyWGs0TOgQo2tOa/xRDV5M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLl+g6FUmPczFMVcqmJ284fStiwzmvJATmUnKcqTKn15urXjQOa
	Qy2t83RFdlbjTS+Wx/jrtUYp4Pj553vJ6C62GT8a8zjYsCubNoPb/2PhJtAjCVqBr1Oc0xt64zB
	7Qx2Fs5YUCG9UF5g3G/gxZPp1oL6Fciw=
X-Gm-Gg: AYBFou39oie52b8pvtPkvMSPSNewisGSqEpYRynvd9dfveKwlmooZK1TuLMWp02AuF/
	WO/lfyztSgH/U3D15CxnWfc3H8Nz6QVZ6C7Y7glbJOdaaEzgMmQDyFoTBcKzPppMkK7R04kDfb9
	MVKA52YdL1Bdd6Pc0GgTrqaSCD1Mx1fwGZjIHpfxOnn7tqKsnVbQJngBtm0asNmUCL0RqTgqK9z
	Tk6bxT31bgOxLkT7C9WI2ZWsY+vKrNSJ1WqDYG2/4xpzrEoYFf3LZ/bPz/Ct+/S+Y7L2BILa9U0
	hbyhlPwQv9HGubTGrhigwhSFTPjw0G+b3OI1asnXWwv8sNNQFq2ZYiYo7mB1w8G1Q4FJgGyBn3a
	T6YfOsp5Zt/6ca27VaFM/b/8DmLzQVsUR2Fu3+QMjAP9bS9xtghTkg6JI838g59wvNKDHJAci1A
	x4QNOnGucqHCq2o7jmI86N
X-Received: by 2002:a17:907:3f8e:b0:c29:f5d5:5aa7 with SMTP id
 a640c23a62f3a-c31aa0c0ae8mr355096366b.49.1791604186895; Fri, 09 Oct 2026
 20:49:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Perlow, Jason" <jperlow@gmail.com>
Date: Fri, 9 Oct 2026 23:49:35 -0400
X-Gm-Features: AclHuK8tLlsj04-qdY1M1uq0VlVi4LCtBYcpexWHP6C-VMCJXIeCQa4uODnFQf4
Message-ID: <CABZrw2EfeChvuWDJ_hiwr9Oh_QpyrfZKLq_-jOxkzZH=fr575Q@mail.gmail.com>
Subject: PCI/AER: MacBookPro16,1 test results with Apple SEP ANFE quirk
To: Bjorn Helgaas <bhelgaas@google.com>, Lukas Wunner <lukas@wunner.de>
Cc: Aditya Garg <aditya.garg@linux.dev>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	"Oliver O'Halloran" <oohall@gmail.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: multipart/mixed; boundary="0000000000002cd88d065d745b4d"

--0000000000002cd88d065d745b4d
Content-Type: text/plain; charset="UTF-8"

Bjorn, Lukas,

I have tested the Apple SEP ANFE quirk together with Lukas's false-alarm
recovery fix on two MacBookPro16,1 systems. Both stayed up for over two
hours after booting the candidate kernel. The patch is being prepared
against pci/for-linus at 79c168e2aa957ed0054c93db17caba653b95e377.

The candidate retains eddba19b8b5f ("PCI/AER: Support Advisory Non-Fatal
Errors"), adds 79c168e2aa95 ("PCI/AER: Skip error recovery on false
alarms"), and leaves the ANFE mask unchanged only on the Apple T2 Secure
Enclave Processor [106b:1802]. The global ANFE revert is absent from the
test kernel. The per-device flag approach follows Aditya's earlier
proposal, with an EARLY fixup so the flag is set before pci_aer_init().

The test systems are:

  MEDUSA:  MacBookPro16,1, Core i7-9750H
  CHIMERA: MacBookPro16,1, Core i9-9980HK

Both ran 7.3.0-rc6-6-t2-edge-apple-sep-anfe-test, confirmed by uname and
the kernel banner in each current boot journal. At the 23:24 EDT check
on October 9, MEDUSA had 2 hours 22 minutes uptime and Chimera had
2 hours 21 minutes. Their boot IDs were unchanged from the initial
successful candidate boots. graphical.target and the display manager
were active on both, and neither had failed systemd units.

Read-only config-space checks gave the same results on both systems:

  Function                    Correctable error mask
  Apple SEP, 04:00.2           0x00006000
  Apple function, 04:00.0      0x00004000
  Apple function, 04:00.1      0x00004000
  AMD GPU, 03:00.0             0x00000000

ANFE bit 13 is therefore masked on the SEP and unmasked on the other
observed functions. No config-register writes were used in these checks.
The implementation matches vendor/device ID, not these bus addresses.

Neither candidate boot journal contains an AER/GHES report, kernel
panic, oops, BUG or call trace. Neither recorded additional kernel
messages after the initial 21:04 checks through the 23:24 check.

The earlier Wunner-only candidate booted on MEDUSA but then powered off,
as I reported on October 8. Its retained journal ended before that event;
there was no recorded shutdown sequence or panic. The cause of the power
loss is still unknown, and this quirk does not establish a firmware
mechanism. The combined candidate has not reproduced that symptom within
the observed interval.

There are remaining boot warnings unrelated to the reported AER symptom:
ACPI duplicate-table/method errors, AMD SDMA fence fallback warnings,
HID rotation probe failures, and Broadcom P2P failures. Chimera also logs
CPU 0 machine-check records in banks 12 and 13. These warning categories,
including the same machine-check status/address records, appear in the
previous boot logs. I am retaining them as separate follow-up issues.

This was a v7.3-rc6 test build with the existing T2 driver/patch stack,
using Debian Forky GCC 16.2 and binutils 2.47. It was not a vanilla
upstream kernel or an identical-toolchain comparison to the older GCC 14
release image. Artifact checksums, exact source/provenance, config checks,
t2gmux/t2smc builds and imported-symbol CRC checks passed. A generic
KVM/OVMF boot also passed; the hardware observations above come from the
two physical systems, not KVM.

The T2 team reports that [106b:1802] identifies the SEP across T2 models,
but this report covers only these two MacBookPro16,1 machines. I have not
tested other T2 models, power-off/cold-start, suspend/resume, reset, kexec
or deliberate AER error injection. Physical confirmation of the rendered
GUI is not included in this report; desktop service state was checked
remotely. The existing release/rescue boot files were preserved.

The patch (enclosed) leaves other ANFE handling enabled and is idempotent across
repeated fixup/AER initialization. Please review it as a targeted workaround
for the MacBookPro16,1 regression, with the testing limits above.
I also have a zip file with all logs/evidence if needed.

Thanks,
Jason

--0000000000002cd88d065d745b4d
Content-Type: application/octet-stream; 
	name="apple-sep-anfe-quirk-clean.patch"
Content-Disposition: attachment; filename="apple-sep-anfe-quirk-clean.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mv1urcfi0>
X-Attachment-Id: f_mv1urcfi0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL3BjaWUvYWVyLmMgYi9kcml2ZXJzL3BjaS9wY2llL2Fl
ci5jCmluZGV4IDkyMmE3MjZhNTJhNS4uNzMyZjc1YTMxNzYwIDEwMDY0NAotLS0gYS9kcml2ZXJz
L3BjaS9wY2llL2Flci5jCisrKyBiL2RyaXZlcnMvcGNpL3BjaWUvYWVyLmMKQEAgLTQyOCw3ICs0
MjgsOCBAQCB2b2lkIHBjaV9hZXJfaW5pdChzdHJ1Y3QgcGNpX2RldiAqZGV2KQogCSAqIEFkdmlz
b3J5IE5vbi1GYXRhbCBFcnJvcnMgYXJlIG1hc2tlZCBieSBkZWZhdWx0IChQQ0llIHI3LjAsIHNl
YwogCSAqIDcuOC40LjYpLgogCSAqLwotCWlmIChwY2llX2Flcl9pc19uYXRpdmUoZGV2KSAmJiBk
ZXYtPmRldmNhcCAmIFBDSV9FWFBfREVWQ0FQX1JCRVIpCisJaWYgKHBjaWVfYWVyX2lzX25hdGl2
ZShkZXYpICYmIGRldi0+ZGV2Y2FwICYgUENJX0VYUF9ERVZDQVBfUkJFUiAmJgorCSAgICAhZGV2
LT5ub19hZXJfYW5mZSkKIAkJcGNpX2NsZWFyX2FuZF9zZXRfY29uZmlnX2R3b3JkKGRldiwKIAkJ
CQkJICAgICAgIGRldi0+YWVyX2NhcCArIFBDSV9FUlJfQ09SX01BU0ssCiAJCQkJCSAgICAgICBQ
Q0lfRVJSX0NPUl9BRFZfTkZBVCwgMCk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9xdWlya3Mu
YyBiL2RyaXZlcnMvcGNpL3F1aXJrcy5jCmluZGV4IGRlOWJiY2NkYTIxZi4uNjc3Y2Q4Nzk3ZDE5
IDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9xdWlya3MuYworKysgYi9kcml2ZXJzL3BjaS9xdWly
a3MuYwpAQCAtMjU3NCw2ICsyNTc0LDE3IEBAIHN0YXRpYyB2b2lkIHF1aXJrX3A2NGgyXzFrX2lv
KHN0cnVjdCBwY2lfZGV2ICpkZXYpCiB9CiBERUNMQVJFX1BDSV9GSVhVUF9IRUFERVIoUENJX1ZF
TkRPUl9JRF9JTlRFTCwgMHgxNDYwLCBxdWlya19wNjRoMl8xa19pbyk7CiAKKy8qCisgKiBVbm1h
c2tpbmcgQWR2aXNvcnkgTm9uLUZhdGFsIEVycm9ycyBvbiB0aGUgQXBwbGUgVDIgU2VjdXJlIEVu
Y2xhdmUKKyAqIGNhdXNlcyBhIE1hY0Jvb2tQcm8xNiwxIHRvIGxvc2UgcG93ZXIuICBTZXQgdGhp
cyBiZWZvcmUgcGNpX2Flcl9pbml0KCkKKyAqIHNvIHRoYXQgaXQgbGVhdmVzIHRoZSBBTkZFIG1h
c2sgYml0IHVuY2hhbmdlZC4KKyAqLworc3RhdGljIHZvaWQgcXVpcmtfbm9fYWVyX2FuZmUoc3Ry
dWN0IHBjaV9kZXYgKmRldikKK3sKKwlkZXYtPm5vX2Flcl9hbmZlID0gMTsKK30KK0RFQ0xBUkVf
UENJX0ZJWFVQX0VBUkxZKFBDSV9WRU5ET1JfSURfQVBQTEUsIDB4MTgwMiwgcXVpcmtfbm9fYWVy
X2FuZmUpOworCiAvKgogICogVW5kZXIgc29tZSBjaXJjdW1zdGFuY2VzLCBBRVIgaXMgbm90IGxp
bmtlZCB3aXRoIGV4dGVuZGVkIGNhcGFiaWxpdGllcy4KICAqIEZvcmNlIGl0IHRvIGJlIGxpbmtl
ZCBieSBzZXR0aW5nIHRoZSBjb3JyZXNwb25kaW5nIGNvbnRyb2wgYml0IGluIHRoZQpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9wY2kuaCBiL2luY2x1ZGUvbGludXgvcGNpLmgKaW5kZXggZDMx
YThkMTA3YjFlLi41ZmZjZjVjZThjOTYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvcGNpLmgK
KysrIGIvaW5jbHVkZS9saW51eC9wY2kuaApAQCAtNDY3LDYgKzQ2Nyw3IEBAIHN0cnVjdCBwY2lf
ZGV2IHsKIAogCXVuc2lnbmVkIGludAlpc19idXNtYXN0ZXI6MTsJCS8qIElzIGJ1c21hc3RlciAq
LwogCXVuc2lnbmVkIGludAlub19tc2k6MTsJCS8qIE1heSBub3QgdXNlIE1TSSAqLworCXVuc2ln
bmVkIGludAlub19hZXJfYW5mZToxOwkJLyogRG8gbm90IHVubWFzayBBTkZFICovCiAJdW5zaWdu
ZWQgaW50CWJsb2NrX2NmZ19hY2Nlc3M6MTsJLyogQ29uZmlnIHNwYWNlIGFjY2VzcyBibG9ja2Vk
ICovCiAJdW5zaWduZWQgaW50CWJyb2tlbl9wYXJpdHlfc3RhdHVzOjE7CS8qIEdlbmVyYXRlcyBm
YWxzZSBwb3NpdGl2ZSBwYXJpdHkgKi8KIAl1bnNpZ25lZCBpbnQJaXJxX3Jlcm91dGVfdmFyaWFu
dDoyOwkvKiBOZWVkcyBJUlEgcmVyb3V0aW5nIHZhcmlhbnQgKi8K
--0000000000002cd88d065d745b4d--
