Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794885587;
	b=zgUfFy/TR6pg9lIyIpaIQvukN4x8lHtVdhkzh17flAw10jHsRcopvdl41v73/vQmUnRD
	 uV59VgjvFN8N5k87umJL/ssduWOd5afkjN/fElsdr3GQcGqjT94DPaIOi93Z/TV++Gyw2
	 TVZEwCVdRBMDe35WiZBi488jMwvLTJ6MWZkegkKyhs8H8X4GjBdDdrTaLFg17/pKatkJ5
	 ZjvwSSdxNUGOzTxDowQrm/zzodTXyL9Ncawv33QtpkGcgDODQYXaxYgVhrjFUGrfe6soV
	 aGEqHOuahztHedQgv6K0PqMYDmdjNDk/EJM6Z0J+poSq/wZXuf0CE1kUE2RTiFT51dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b09tesBM7lkdOLm8WuptfSXWkia8bEV4LxPm4Ivd3OM=;
	b=F3JPDUGRLVKPkiAuZARoGsmlTBx36t6pJ1Nwv9kWwB604v+ElBO5wL1rzQt0EzSCw5H8
	 oRQmk8GP1l+hs3JEOSswP6dxGY+G5xOgz8RYItEdmp4j/T2FsTBfU384qSf5Im1iuq8e0
	 lT3G14c3uzcjh6jwagml7XhxA6fz2237iNAokTmzmtNy2qQQhKDnKj75gYjxQmK0rzKGT
	 KM5jNlM0lh04F3AEV8lsjuPXjLHFaAYMuceL3m8C22+UOUbqEIsTzULys5ur8NOgyN6ML
	 SwY8OAyZMRFufYD+Du6KtjDD2W3MdmOv/Xji9lvBhjg53LiSCsZLljh4wPoveyTLZQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GM2ongOV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F95606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74F95606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GM2ongOV
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eae1276409so1537117e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:19:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794885585; cv=none;
        d=google.com; s=arc-20260327;
        b=mi3E9imnBDRi/2NcYVDz9rPNUTFFQM5yPyLsXI1kxI5fRf6GgVtpRCIHXNwru/jo9T
         MxLqLk+JLCtbaUn8ZO7VBuy36Ls5NZwL/sWDW8X5xG2wILMgZdfO5P/F8Z/GAJ16k9w6
         dCT91jKuL1+/igWdB7BTwRQl6mRMLr3bGJuJHEygM8ovtmrkY/Beb9Z1UCDZCVmTgHB0
         IdOozcNWPH5v0IluO5m8QTcTawFgTqrhPzwCAnKwBIvMbN+wNPKjdw9Kt7MkGp8vGgcU
         GbJQWPmM5jxDJp46m3SgygSSBDWAkNZNsVL0F2/X5Jt3UDJrw/DDzjdtE1XdlD5JrjDP
         kafQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b09tesBM7lkdOLm8WuptfSXWkia8bEV4LxPm4Ivd3OM=;
        fh=AlzLO4LuxAf2q6XWIfnQ9b7V2+EtMgqQzuG65AJnc0Q=;
        b=AEOR46/Rx6IwT0DG5cf04HC+B3/buPNOdmgD1P/bJ352hY1dL91UZc/b6aWvMUMVy3
         IcRer3TyD6VsfRIELBdgMGzVteOKIKOUthaUzf6HRrePyB/2DnRh31iGyiw+GkP8DRO2
         sKPzexCvfUIE000eEOuk9buB8u6O2naoncFVy1u7HD2H58BeKfvmRCE+aaTY7XX5eyTY
         fOmzt7GyoatTa04v1JbDaeH0QKENWSoVihkz6Q+/0lNQ3hrUxsoQmk87PFw5Cl2lPHv5
         NljZb7TErKcQth6fBPTrD9kcrxANVzvq5oWLT/A3xo9q4934iEy1tZKgDIIqZg6yNKli
         eeKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794885585; x=1795490385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b09tesBM7lkdOLm8WuptfSXWkia8bEV4LxPm4Ivd3OM=;
        b=GM2ongOVPa27otv6iFH/geaguJpZVq7INdBUu7V3km/Ooo0G987kbyyyrOjDlxEbQI
         zqK3NlhwvyrKGG3de45wm1g5ehAoz+4cgxrXUn1Rb3rJVm5LMOdV7Zt+JkFO+FkqY3VD
         fBK605AD2VdC0vk3kfejCEfVuhgU/moNSedV7xqRkEyHC1+TqOM9YlIr6pb6mUtuuTZQ
         fVauxiMunolXBeTOduPAzDsH08UrCe8Vb1e82KHPXEyTWgTU3dLKuOyFzqMZKMfwAzBY
         Q01MNGyp/RyyEF/hGC5vJ0QDEWAdzg47D9pTb+pO46jvB449Hs5n8mfqfrE41r2dZPRE
         7RRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794885585; x=1795490385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b09tesBM7lkdOLm8WuptfSXWkia8bEV4LxPm4Ivd3OM=;
        b=p26waGLK9kh08HS45fKfdG09xZZjzaNQqa1tsn2cOnwjsmp3AY5XcKbVWQlg1mvIQg
         zSxB+r1dX8dyOzHKSugC5ZIFZRP6rPCKuGypcTtUiZbM0T4NtKnv4ZtaFfpfOp8crkVJ
         10nhRlwZIRyPprOqzhwW5eEA5PLFUo5CcmyfrKZje+VqKHtiXaG3X3khI2fEld9iHOrr
         jNeasTrcarryd+4WY/bscoX5p9zJWUX7AEBmmAdS+PqUu5o2beBG1O1jfTfdhnDTwPVO
         0SfWzcSOZQ9RNKttadGg0JEJD1u3P/kw/8eLeShfHVzz5e386afOVBMDRJYoL8O380MT
         q37w==
X-Forwarded-Encrypted: i=1; AL+hErFCU2D0Zjc0AEDu+gV1hp7zF7czQg1REP0OVnOKk4sVSpXq5k+oTJ7zpVR9XbfTRzBllnS6A4QQ/pXUFVg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/czaZFItBbZyQM+WIKsAUxU8jnIgoQBX28dR74rwI1F7vnqnvf
	/3rO3xE+Jhs59i8AdpnpQgr+z92kIEs2YjPb8GrgqqtuNFHhcl6fOvjlzWyAv+jvk7HG8/PGLXK
	V7hQQvD+4byeutjudgEV6HMmsNC/a909l0ci0Z+o=
X-Gm-Gg: AYBFou2+NbiCXYoFVRVBh3oAjpJr2piHlfA0FR/mmvavJP3wZz7HrzxpKnHR4d2CkqV
	bz17Q5sMgugivEyhdEx948wdtAVvoTtq5zIq5G7VGKjW+mMhV6LPQT3l/vFJ9aD+es4ltc6vxXT
	i+bm+1YkE5R7xo+CfUMoVVCF3ClMb1cmufDeGURG6PlUg8XFV2ghxJQtMFSRpDGyP6AdTvaKCG1
	XGqPft1mJo8uiOLXmjLnaWVF7TR5SLg9ScLkT4P5goUFOTbOxvVrwRwGLV/ObqXvC007Cvq2YZ+
	wNFNLf/TIOYoaEbbgEkzRza5r32ErHvHEw/ElaZj+cSk5fbQYnaxxfkxvnAHs3DaxmN9k/95UZ4
	AXAbz4dbnaMxbeuimNi06qIkxfXUv+ztFcgPRBWhZmcSQGpG4lJYMwZkchxB8ojrvm36fHHPXBP
	avXPkoygrDgAetd+aWbRc37EawVjyoo+65PgsBhQb75TNVdNG/CJAD02dXF4r7ZvUoC5qvbJn84
	3c1qoyFqJtQFi7jOzznmPHyB7jenA==
X-Received: by 2002:a05:6122:468a:b0:5c9:a60d:327a with SMTP id
 71dfb90a1353d-5ee34a79222mr4521298e0c.14.1794885585291; Mon, 16 Nov 2026
 19:19:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
 <YT6PR01MB637077E06DBE5CD43E1EE13E43D87B2@YT6PR01MB637077.CANPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <YT6PR01MB637077E06DBE5CD43E1EE13E43D87B2@YT6PR01MB637077.CANPRD01.PROD.OUTLOOK.COM>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 20:19:34 -0700
X-Gm-Features: Aa3M54p1O22925YXU2FqbFLG4F7I5egeYZXVTUe6AK-ujXoidJd3q8yRFyQVqkM
Message-ID: <CADvTj4o2+ypGiXe3ocpcwKbjpnVJF+-X8hZLtfW3prdaFOt3eA@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] dmaengine: dw-axi-dmac: fix termination and pause acknowledgment
To: Mitch Barnett <mitch@accuratesound.ca>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Sergey Khimich <serghox@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sia Jee Heng <jee.heng.sia@intel.com>, 
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Wang YuWei <1973615295@qq.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 7:43=E2=80=AFPM Mitch Barnett <mitch@accuratesound.=
ca> wrote:
>
> Hi James,
>
> Thank you for incorporating the descriptor-callback lifetime and IRQ/chan=
nel-reuse fixes in v6.
>
> We've continued investigating the remaining STOP/ABORT safety question on=
 our Raspberry Pi 5 (RP1) test system, particularly the lifetime of client-=
owned ALSA PCM buffers after unsuccessful DMA termination.
>
> We've completed several additional investigations against Raspberry Pi Li=
nux 6.18.50, pinned at cff533aec2fa601846766b32ff57204e0a61bed7:
>
> 1. DMAengine/ALSA STOP contract (V24R33): Eight source-executed host test=
s passed. A simulated dmaengine_terminate_async() failure (-ETIMEDOUT) is n=
ot propagated by snd_dmaengine_pcm_trigger(). The snd_dmaengine_pcm_sync_st=
op() path returns success after callback synchronization without independen=
tly verifying hardware quiescence.
>
> 2. ALSA buffer lifetime (V24R34/V24R35): Twelve further source-executed h=
ost cases passed. The pinned ALSA core can release managed dynamic buffers =
despite an hw_free error. Preallocated buffers can be detached and subseque=
ntly reused. This exposes a potential client-memory lifetime problem indepe=
ndently of the DMA driver's descriptor pool.
>
> 3. Live RP1 configuration (V24R36=E2=80=93V24R39): Read-only inspection c=
onfirmed the HiFiBerry Digi sound card bound through snd-rpi-wm8804 and des=
ignware-i2s. The live I=C2=B2S1 device tree contains TX/RX DMA mappings and=
 no I=C2=B2S interrupt property. However, its PCM streams do not expose the=
 expected prealloc entries, and we're still reconciling the effective PCM c=
omponent and allocator.
>
> These are source-level tests and read-only hardware configuration checks.=
 We have not reproduced a client-buffer use-after-free on RP1 hardware.
>
> We've also prepared an isolated combination incorporating Raspberry Pi's =
per-channel ABORT implementation (PR #7654). It compiles against our matchi=
ng kernel source, but we have deliberately not installed or exercised it on=
 the hardware.
>
> Our remaining concern is that retaining DMA descriptors does not establis=
h that independently owned PCM pages are safe to release. The Synopsys DW_a=
xi_dmac documentation cautions that an ABORT does not necessarily complete =
outstanding AXI transactions.

I checked the corresponding mainline paths. Mainline currently warns on
a termination timeout, frees the descriptors and returns success. The v6
change retains those descriptors and returns the error, but that does
not protect a client buffer if the caller ignores the error and proceeds
with cleanup. The final channel-resource release path also still needs
to account for unsuccessful termination.

This is a remaining limitation of the failed-stop handling, rather than
a problem introduced by the descriptor-retention change.

>
> Could you or the other DMAengine maintainers clarify two points?
>
> 1. Hardware quiescence: Is there an RP1-specific hardware condition, or s=
upported controller recovery sequence, that positively guarantees all outst=
anding DMA transactions have completed after a failed STOP followed by ABOR=
T? In particular, does this account for in-flight AXI/PCIe writes and the s=
hared DMA master?

I cannot confirm an RP1-specific guarantee. The 1.02a databook also
appears internally inconsistent: section 2.15.5 on page 92 describes
completing initiated AXI transfers before reporting the channel aborted,
whereas the CH1_ABORT description on page 178 explicitly warns that
those transfers might not have completed.

That needs clarification before relying on CH_EN clearing after ABORT
as permission to release memory. Mainline does not currently use ABORT,
so the software lifetime issue exists independently of that mechanism.

>
> 2. Client-buffer ownership: If no such guarantee exists, what would be th=
e preferred upstream approach to preventing ALSA from freeing or reusing DM=
A-addressable PCM memory after an unrecoverable termination failure? Would =
this require a coordinated DMAengine/ALSA fail-closed mechanism, including =
the HW_FREE, error-cleanup, close, and device-removal paths?

The DMAengine synchronize contract already requires transfers to have
stopped, as well as callbacks to have finished. DW AXI currently only
calls vchan_synchronize(), which cannot establish hardware quiescence
after termination has failed.

Simply propagating the error through snd_dmaengine_pcm_trigger() would
not be sufficient: the PCM core ignores the STOP return value, and
managed-buffer cleanup proceeds even when hw_free returns an error.

A provider recovery path that guarantees the hardware has stopped
before synchronization returns could avoid introducing new PCM buffer
ownership rules. If that guarantee cannot be provided and cleanup is
allowed to continue, retaining only the descriptor pool is insufficient:
the client buffers and their DMA mappings must also remain valid, with
reuse and removal covered as well.

>
> We're holding off on forced STOP/ABORT testing until we can establish a d=
efensible memory-lifetime contract.
>
> Any guidance on the hardware guarantee or appropriate upstream design wou=
ld be greatly appreciated.
>
> Thanks again for your work on this.
>
> Kind regards,
> Mitch Barnett
> Accurate Sound
>
> References:
>
> Raspberry Pi per-channel ABORT implementation:
> https://github.com/raspberrypi/linux/pull/7654
>
> Pinned Raspberry Pi kernel source:
> https://github.com/raspberrypi/linux/tree/cff533aec2fa601846766b32ff57204=
e0a61bed7
>
> ________________________________________
> From: James Hilliard <james.hilliard1@gmail.com>
> Sent: Sunday, November 15, 2026 10:00 PM
> To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>; Vinod Koul <vkoul@ker=
nel.org>; Frank Li <Frank.Li@kernel.org>; Sergey Khimich <serghox@gmail.com=
>; Andy Shevchenko <andriy.shevchenko@linux.intel.com>; Sia Jee Heng <jee.h=
eng.sia@intel.com>
> Cc: Mitch Barnett <mitch@accuratesound.ca>; dmaengine@vger.kernel.org <dm=
aengine@vger.kernel.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.k=
ernel.org>; James Hilliard <james.hilliard1@gmail.com>; stable@vger.kernel.=
org <stable@vger.kernel.org>; Wang YuWei <1973615295@qq.com>
> Subject: [PATCH v6 0/7] dmaengine: dw-axi-dmac: fix termination and pause=
 acknowledgment
>
> Keep cyclic mode in each descriptor so failed preparation and queued
> work cannot change the completion handling of another transfer.
>
> Use the layout-aware channel enable check during termination and retain
> transfer resources when the channel does not stop. Preserve suspension
> status for the pause and resume paths, including acknowledgments that
> arrive after a polling timeout or during another channel's interrupt.
>
> Keep a pending pause across cyclic segment completion and resume the
> segment only after the client releases the pause. Track the active
> descriptor until completion so queued work cannot reissue it while its
> interrupt is pending.
>
> Retain terminated descriptors until their callbacks have drained, includi=
ng
> cyclic descriptors that error handling has moved to the completed list.
> Serialize interrupt status collection with channel reuse so an old event
> cannot complete a replacement transfer.
>
> This series uses the shared virt-dma descriptor-retirement helper [0].
>
> [0] https://lore.kernel.org/r/20261115-submit-sun4i-dma-callback-lifetime=
-v1-v2-1-fb7d258702f8@gmail.com/
>
> Assisted-by: Codex:gpt-6-astra
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes in v6:
> - Retain descriptors through callback synchronization using the posted
>   virt-dma helper, covering pending, executing and error-completed cyclic
>   callbacks raised in Mitch's follow-up.
> - Serialize interrupt status collection with channel reuse and clear old
>   completion and error status after successful termination.
> - Link to v5: https://patch.msgid.link/20261113-submit-dw-axi-dma-stop-pa=
use-v1-v5-0-8523a27b5788@gmail.com
>
> Changes in v5:
> - Use a positive enabled-channel condition in the suspend-status helper,
>   following Andy's review.
> - Initialize the resume result immediately before its first use.
> - Separate the lock-protected channel bitfields from the preceding fields=
.
> - Link to v4: https://patch.msgid.link/20261112-submit-dw-axi-dma-stop-pa=
use-v1-v4-0-3ebc24b243db@gmail.com
>
> Changes in v4:
> - Add a preparatory fix for cyclic mode leaking between transfers,
>   following Sashiko's review. Store the mode in each descriptor so
>   failed preparation, error recovery and queued work cannot change
>   another transfer's completion handling.
> - Link to v3: https://patch.msgid.link/20261110-submit-dw-axi-dma-stop-pa=
use-v1-v3-0-35fdfba8b61d@gmail.com
>
> Changes in v3:
> - Wrap the atomic polling calls by argument group and correct their
>   continuation indentation, following Andy's review.
> - Move the termination return-value check simplification into the
>   channel-enable polling patch.
> - Separate the pause-loop conversion to atomic polling from the
>   pending-request and cyclic-restart changes.
> - Annotate the suspend-wait helper with its channel-lock requirement.
> - Pack the lock-protected flags into existing padding while keeping
>   cyclic separately writable, following Andy's review.
> - Link to v2: https://patch.msgid.link/20261109-submit-dw-axi-dma-stop-pa=
use-v1-v2-0-64adc48df793@gmail.com
>
> Changes in v2:
> - Use readx_poll_timeout_atomic() for the single-argument status helpers
>   and express the termination polling interval and timeout in millisecond=
s,
>   following Andy's review.
> - Track pending suspend requests separately from confirmed suspension so
>   resume can handle acknowledgments received after a pause timeout.
> - Use the atomic polling helper, including its final status check, and
>   report -EAGAIN if resume cannot yet cancel a pending suspend request.
> - Defer cyclic restart while paused and track the active descriptor until
>   completion, preventing resume or issue_pending from reissuing it.
> - Reset pause state on successful termination and channel allocation;
>   clear stale status when starting a new descriptor.
> - Link to v1: https://patch.msgid.link/20261108-submit-dw-axi-dma-stop-pa=
use-v1-v1-0-c48ec19e9ee4@gmail.com
>
> To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> To: Vinod Koul <vkoul@kernel.org>
> To: Frank Li <Frank.Li@kernel.org>
> To: Sergey Khimich <serghox@gmail.com>
> To: Sia Jee Heng <jee.heng.sia@intel.com>
> To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: dmaengine@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
>
> ---
> James Hilliard (7):
>       dmaengine: dw-axi-dmac: keep cyclic mode in the descriptor
>       dmaengine: dw-axi-dmac: poll the correct enable bit during terminat=
ion
>       dmaengine: dw-axi-dmac: retain descriptors when termination times o=
ut
>       dmaengine: dw-axi-dmac: use atomic polling for suspend acknowledgme=
nt
>       dmaengine: dw-axi-dmac: preserve pending pause requests
>       dmaengine: dw-axi-dmac: retain descriptors until callbacks drain
>       dmaengine: dw-axi-dmac: serialize interrupt status with channel reu=
se
>
>  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 183 +++++++++++++++++--=
------
>  drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |  10 +-
>  2 files changed, 130 insertions(+), 63 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.=
git fixes
> change-id: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169
> prerequisite-patch-id: fc343480330da5ff95e5271997fa71107977c2b8
>
> Best regards,
> --
> James Hilliard <james.hilliard1@gmail.com>
