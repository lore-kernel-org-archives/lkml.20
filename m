Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C5F33372A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266793; cv=none; b=OSe2inglQ80q+wwF+ojHPoWdHAFz6MfjDcVS/rkCQ7sqbkYecwoTTHOrKcktWo4Lr6l8KAanmApa3cOANJRmmFX2MF9QLWVuhC7gf/YLyCsklJnEuVjRY8725cRkLEo025ydyzjTqWQH7cB86Xk5CNjCWGSgy4cMAQ5AK+VXV18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266793; c=relaxed/simple;
	bh=NSeAD/eZLDZOVM0OQsTNJ1qd6++QLs+1eoWmQ0nZMco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOSxdBaqhjna2YyU08IZbk3tvzaxkg2sVevb8SMnbJ/qoMj13oAnPRhRryfNxooAGEzM0wEYeOQT7ECcem2UKKI0n57G+xyXb1X2CxA2ytD2yyg4Iiu4sT+8s/pHWjQb640Uu+QVjcBb2f0DbkG8l/53TXfLb0b1WnirxyA6bNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KUCLM4qC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KUCLM4qC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5DA71F000FF;
	Thu, 24 Sep 2026 16:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790266791;
	bh=aK1+hDCvHhPngONyTHrHjieWu1c4QXwqvCZUvrnFSA4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KUCLM4qCl/Jrv7wgCWQEyArooAoWfMFWOiHliw0iQGCLLTRrtSqlAyfcjj31qeY/B
	 Bnruq0TG+boIBqqsT3hzzszKCqr0EjUVb9QsmxTbelPBTe0rHyP4s5glc8WVPfY3Ja
	 md7187EmnBbm2UdJeIC/plifTdHSED3yvJ+92ZFqEHUD0MpEidfxiMQIGn/d/O/eYM
	 21GD7SpTUiMTxr5JfEnqZziNdWYK0WTqEHYnBNiMLNU9SALg/4Voxz5PpjWDYtCgdE
	 9nb6da2yLQqPG/bTHnuob25zV8bxyJSH9vvs0jm6LvUZSLcrUBJkIBuPxjksYE6SCP
	 12n7Z51IPnszQ==
Message-ID: <2f93f2c5-d035-45a4-a18c-69fff2facb86@kernel.org>
Date: Thu, 24 Sep 2026 11:19:49 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] firmware: socfpga-fcs: add Altera SoCFPGA FCS
 driver with SDOS
Content-Language: en-US
To: hang.suan.wang@altera.com, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com, tze.yee.ng@altera.com,
 chee.nouk.phoon@altera.com, genevieve.chan@altera.com,
 adrian.ho.yin.ng@altera.com
References: <cover.1790183372.git.hang.suan.wang@altera.com>
 <837f32ee94aa34c5149812bbca3bb07f5ae7d355.1790183375.git.hang.suan.wang@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <837f32ee94aa34c5149812bbca3bb07f5ae7d355.1790183375.git.hang.suan.wang@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/23/26 12:23, hang.suan.wang@altera.com wrote:
> From: Hang Suan Wang <hang.suan.wang@altera.com>
> 
> Add the Altera SoCFPGA Crypto Service (FCS) driver, which exposes the
> Secure Data Object Service (SDOS) encrypt/decrypt operation to
> non-secure host software.
> 
> The SDOS protects data at rest: the SDM encrypts and decrypts using a key
> derived from a device-unique SDOS root key plus an SDM-generated IV, so
> the host never handles raw key material or IVs. It only submits plaintext
> it already owns and receives authenticated ciphertext objects managed by
> the SDM. A primary use case is the operational keys are installed without
> ever appearing in cleartext.
> 
> The driver is a standalone module and describes no hardware of its own.
> It binds by name to the "stratix10-fcs" platform device registered by
> stratix10-svc, so no device-tree node is required. SDOS requests go to
> the SDM through the stratix10-svc asynchronous SIP SMC path using
> service-layer memory pool buffers that the SDM can reach via physical or
> SMMU-remapped addresses. Userspace talks to /dev/socfpga-fcs via ioctl
> and sysfs exposes atf_version.
> 
> For encryption the SDM returns a structured object (header, ciphertext,
> HMAC). For decryption the SDM validates the HMAC and enforces the 64-bit
> owner ID from the object header so only the creator can decrypt it.
> 
> Each SDOS request opens an SDM crypto session, runs under priv->lock
> (one in-flight transaction), and closes the session afterwards.
> 
> Signed-off-by: Hang Suan Wang <hang.suan.wang@altera.com>
> ---
>   Documentation/misc-devices/index.rst          |   1 +
>   Documentation/misc-devices/socfpga-fcs.rst    | 140 ++++
>   .../userspace-api/ioctl/ioctl-number.rst      |   1 +

You forgot to include the maintainers for these files:

Jonathan Corbet <corbet@lwn.net> (maintainer:DOCUMENTATION)
Shuah Khan <skhan@linuxfoundation.org> (reviewer:DOCUMENTATION)
Randy Dunlap <rdunlap@infradead.org> (reviewer:DOCUMENTATION)

>   MAINTAINERS                                   |  10 +
>   drivers/firmware/Kconfig                      |  17 +
>   drivers/firmware/Makefile                     |   2 +
>   drivers/firmware/socfpga-fcs-core.c           | 700 ++++++++++++++++++
>   drivers/firmware/socfpga-fcs.c                | 296 ++++++++
>   include/linux/firmware/intel/socfpga-fcs.h    | 122 +++
>   include/uapi/misc/socfpga-fcs-crypto.h        |  68 ++q
>   10 files changed, 1357 insertions(+)
>   create mode 100644 Documentation/misc-devices/socfpga-fcs.rst
>   create mode 100644 drivers/firmware/socfpga-fcs-core.c
>   create mode 100644 drivers/firmware/socfpga-fcs.c
>   create mode 100644 include/linux/firmware/intel/socfpga-fcs.h
>   create mode 100644 include/uapi/misc/socfpga-fcs-crypto.h
> 
> diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
> index f911edaecbfa..9cefd8bc15a7 100644
> --- a/Documentation/misc-devices/index.rst
> +++ b/Documentation/misc-devices/index.rst
> @@ -24,6 +24,7 @@ fit into other categories.
>      mrvl_cn10k_dpi
>      oxsemi-tornado
>      pci-endpoint-test
> +   socfpga-fcs
>      spear-pcie-gadget
>      tps6594-pfsm
>      uacce
> diff --git a/Documentation/misc-devices/socfpga-fcs.rst b/Documentation/misc-devices/socfpga-fcs.rst
> new file mode 100644
> index 000000000000..bede6fe3906b
> --- /dev/null
> +++ b/Documentation/misc-devices/socfpga-fcs.rst
> @@ -0,0 +1,140 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===================================
> +Altera SoCFPGA Crypto Service (FCS)
> +===================================
> +
> +Overview
> +========
> +
> +The Secure Device Manager (SDM) is the hardware security controller in Altera
> +SoCFPGA devices. It offers a runtime cryptographic interface, the FPGA Crypto
> +Service (FCS), which the host reaches through the stratix10-svc mailbox using
> +Arm Trusted Firmware SIP SMC calls.
> +
> +This driver exposes one FCS operation: the Secure Data Object Service (SDOS),
> +which encrypts and decrypts data at rest. The SDM derives the working key from
> +a device-unique SDOS root key that never leaves the secure boundary, so the
> +host never handles raw key material. A primary use case is black-key
> +provisioning.
> +
> +The crypto session and the per-request context ID are opened and closed by the
> +kernel around each request. Neither is part of the user ABI.
> +
> +Why a dedicated ioctl
> +=====================
> +
> +SDOS seals and unseals arbitrary application data of up to 32 KiB, not keys of
> +a bounded size, so the keyring payload limits of the trusted-keys subsystem do
> +not apply to it. The object it produces is a firmware-defined container rather
> +than a generic AEAD output, no key is ever set from the host so the crypto API
> +has nothing to bind a transform to, and the SDM returns per-operation status
> +values that must reach the caller alongside a valid result.
> +
> +Device node
> +===========
> +
> +The driver registers a misc device::
> +
> +    /dev/socfpga-fcs
> +
> +Opening it takes a reference on the driver state. If the driver is unbound
> +while the file is open, subsequent operations fail with ``ENODEV`` rather than
> +tearing the file descriptor out from under the caller.
> +
> +Buffer sizes
> +============
> +
> +An SDOS object consists of a 40-byte firmware-defined header, the payload, and
> +for an encrypted object a trailing 48-byte HMAC. The payload is between 32 and
> +32672 bytes.
> +
> +==================  ==================  ==============
> +``op_mode``         ``src_size`` range  Maximum output
> +==================  ==================  ==============
> +non-zero (encrypt)  72 .. 32712 bytes   32760 bytes
> +zero (decrypt)      120 .. 32760 bytes  32712 bytes
> +==================  ==================  ==============
> +
> +Size the output buffer for the maximum shown above. The SDM reports the exact
> +produced length once the operation completes.
> +
> +Data structures
> +===============
> +
> +.. kernel-doc:: include/uapi/misc/socfpga-fcs-crypto.h
> +   :identifiers: fcs_ioc_sdos
> +
> +Driver IOCTLs
> +=============
> +
> +.. c:macro:: FCS_IOC_SDOS
> +.. kernel-doc:: include/uapi/misc/socfpga-fcs-crypto.h
> +   :doc: FCS_IOC_SDOS
> +
> +Return value
> +============
> +
> +On success 0 is returned and the ``__u32`` addressed by ``dst_size`` holds
> +the number of bytes the SDM produced. On error -1 is returned and ``errno``
> +is set.
> +
> +=========== ================================================================
> +Error       Description
> +=========== ================================================================
> +EINVAL      ``dst`` or ``dst_size`` was NULL, or ``src_size`` was out of
> +            range for ``op_mode``.
> +EMSGSIZE    The output did not fit in ``dst``. The operation itself
> +            succeeded and ``error_code`` holds the SDM status, but the
> +            result is discarded, so ``dst`` must be sized for the maximum
> +            output.
> +EFAULT      One of the supplied addresses was not accessible.
> +EIO         The SDM reported a fatal error. ``error_code`` holds the status.
> +ENODEV      The device was unbound while the file descriptor was open.
> +ENOMEM      Staging buffers could not be allocated.
> +ERESTARTSYS A signal arrived while waiting for another request to finish.
> +            Only one SDM transaction is in flight at a time.
> +=========== ================================================================
> +
> +SDM status values
> +=================
> +
> +The ``__s32`` addressed by ``error_code`` carries the firmware status. Two
> +decrypt results are successes that carry a warning: the ioctl returns 0 for
> +both and the plaintext is in ``dst``.
> +
> +======= ================================================================
> +Status  Description
> +======= ================================================================
> +0x000   The operation completed successfully.
> +0x102   Decryption succeeded; reprovisioning the key is recommended.
> +0x103   Decryption succeeded, but not with the latest key.
> +======= ================================================================
> +
> +Any other non-zero status is fatal and the ioctl fails with ``EIO``.
> +
> +User-space usage
> +================
> +A sample userspace application demonstrating these ioctls can be found at
> +`Git Repository - altera-fpga/libfcs <https://github.com/altera-fpga/libfcs>`_
> +
> +Decrypting an object::
> +
> +    __u8 out[32712];                /* maximum decrypt output */
> +    __u32 out_len = sizeof(out);
> +    __s32 status = 0;
> +
> +    struct fcs_ioc_sdos arg = {
> +            .error_code = (__u64)(uintptr_t)&status,
> +            .src        = (__u64)(uintptr_t)in,
> +            .src_size   = in_len,
> +            .dst        = (__u64)(uintptr_t)out,
> +            .dst_size   = (__u64)(uintptr_t)&out_len,
> +            .op_mode    = 0,        /* decrypt */
> +    };
> +
> +    if (ioctl(fd, FCS_IOC_SDOS, &arg) == 0)
> +            /* out_len bytes of plaintext in out */
> +            write(STDOUT_FILENO, out, out_len);
> +    else
> +            fprintf(stderr, "SDOS failed: %m, SDM status 0x%x\n", status);
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index 2fc53093752d..a1e07f7f6870 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -348,6 +348,7 @@ Code  Seq#    Include File                                             Comments
>                                                                          <mailto:luzmaximilian@gmail.com>
>   0xA6  00-0F  uapi/linux/alloc_tag.h                                    Memory allocation profiling
>                                                                          <mailto:surenb@google.com>
> +0xA6  00-1F  uapi/misc/socfpga-fcs-crypto.h                            Altera SoCFPGA FCS (Crypto Service)
>   0xAA  00-3F  linux/uapi/linux/userfaultfd.h
>   0xAB  00-1F  linux/nbd.h
>   0xAC  00-1F  linux/raw.h
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 140eafcbbd78..967fd168d6b7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -945,6 +945,16 @@ ALPS PS/2 TOUCHPAD DRIVER
>   R:	Pali Rohár <pali@kernel.org>
>   F:	drivers/input/mouse/alps.*
>   
> +ALTERA FCS DRIVER
> +M:	Hang Suan Wang <hang.suan.wang@altera.com>
> +M:	Genevieve Chan <genevieve.chan@altera.com>
> +L:	linux-arm-kernel@lists.infradead.org

Why linux-arm? Should be just linux-kernel.

> +S:	Maintained
> +F:	Documentation/misc-devices/socfpga-fcs.rst
> +F:	drivers/firmware/socfpga-fcs*
> +F:	include/linux/firmware/intel/socfpga-fcs*
> +F:	include/uapi/misc/socfpga-fcs*
> +
>   ALTERA MAILBOX DRIVER
>   M:	Tien Sung Ang <tiensung.ang@altera.com>
>   S:	Maintained
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index b7cc11e4fbfa..15727855fd5f 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -193,6 +193,23 @@ config INTEL_STRATIX10_RSU
>   
>   	  Say Y here if you want Intel RSU support.
>   
> +config ALTERA_SOCFPGA_FCS
> +	tristate "Altera SoCFPGA Crypto Services (FCS)"
> +	depends on INTEL_STRATIX10_SERVICE
> +	help
> +	  Altera SoCFPGA Crypto Services (FCS) driver gives user space
> +	  access to the crypto services of the Secure Device Manager (SDM)
> +	  through the Intel Service Layer, with requests forwarded to Arm
> +	  Trusted Firmware.
> +
> +	  The SDM executes or authorizes the requests using device-rooted
> +	  security resources. Protected key material stays within the
> +	  secure firmware boundary and is never exposed to non-secure host
> +	  software.
> +
> +	  Say Y here to add support for Altera SoCFPGA Crypto Services
> +	  (FCS).
> +
>   config MTK_ADSP_IPC
>   	tristate "MTK ADSP IPC Protocol driver"
>   	depends on MTK_ADSP_MBOX
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index be46f1e1dc77..10431273e401 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -11,6 +11,8 @@ obj-$(CONFIG_EDD)		+= edd.o
>   obj-$(CONFIG_DMIID)		+= dmi-id.o
>   obj-$(CONFIG_INTEL_STRATIX10_SERVICE) += stratix10-svc.o
>   obj-$(CONFIG_INTEL_STRATIX10_RSU)     += stratix10-rsu.o
> +obj-$(CONFIG_ALTERA_SOCFPGA_FCS) += altera-fcs.o
> +altera-fcs-y := socfpga-fcs.o socfpga-fcs-core.o

Follow the alphabetical order of these entries.

>   obj-$(CONFIG_ISCSI_IBFT_FIND)	+= iscsi_ibft_find.o
>   obj-$(CONFIG_ISCSI_IBFT)	+= iscsi_ibft.o
>   obj-$(CONFIG_FIRMWARE_MEMMAP)	+= memmap.o
> diff --git a/drivers/firmware/socfpga-fcs-core.c b/drivers/firmware/socfpga-fcs-core.c
> new file mode 100644
> index 000000000000..f4662de8e2af
> --- /dev/null
> +++ b/drivers/firmware/socfpga-fcs-core.c
> @@ -0,0 +1,700 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Altera Corporation
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/random.h>
> +#include <linux/slab.h>
> +#include <linux/unaligned.h>
> +#include <linux/firmware/intel/socfpga-fcs.h>
> +#include <linux/firmware/intel/stratix10-svc-client.h>
> +
> +#define OWNER_ID_OFFSET				12
> +
> +#define SDOS_DECRYPTION_REPROVISION_KEY_WARN	0x102
> +#define SDOS_DECRYPTION_NOT_LATEST_KEY_WARN	0x103
> +
> +#define MSG_RETRY				3
> +#define FCS_RETRY_SLEEP_MS			1
> +
> +struct fcs_cmd_params {
> +	const void	*src;
> +	void		*dst;
> +	u32		src_len;
> +	u32		dst_len;
> +	u32		op_mode;
> +	u64		own;
> +};
> +
> +/**
> + * fcs_atf_version_callback() - service-layer callback for the ATF version query
> + * @client: pointer to the stratix10-svc client
> + * @data: pointer to the service-layer callback data
> + */
> +static void fcs_atf_version_callback(struct stratix10_svc_client *client,
> +				     struct stratix10_svc_cb_data *data)
> +{
> +	struct socfpga_fcs_priv *p = client->priv;
> +
> +	p->status = data->status;
> +	if (data->status == BIT(SVC_STATUS_OK)) {
> +		p->status = 0;
> +		p->atf_version[0] = lower_32_bits(*(unsigned long *)data->kaddr1);
> +		p->atf_version[1] = lower_32_bits(*(unsigned long *)data->kaddr2);
> +		p->atf_version[2] = lower_32_bits(*(unsigned long *)data->kaddr3);
> +		p->atf_version_valid = true;
> +	} else if (data->status == BIT(SVC_STATUS_ERROR)) {
> +		p->status = lower_32_bits(*(unsigned long *)data->kaddr1);
> +		dev_err(client->dev, "mbox_error=0x%x\n", p->status);
> +	}
> +
> +	complete(&p->completion);
> +}
> +
> +/**
> + * fcs_async_callback() - completion callback for an async service request
> + * @ptr: pointer to the completion to signal
> + */
> +static void fcs_async_callback(void *ptr)
> +{
> +	if (ptr)
> +		complete(ptr);
> +}
> +
> +/**
> + * fcs_svc_send_sync() - run a command on the synchronous service path
> + * @msg: service-layer message to send
> + * @timeout: time to wait for the response
> + * Return: 0 on success, negative errno on failure.
> + */
> +static int fcs_svc_send_sync(struct socfpga_fcs_priv *priv,
> +			     struct stratix10_svc_client_msg *msg,
> +			     unsigned long timeout)
> +{
> +	int ret;
> +
> +	reinit_completion(&priv->completion);
> +
> +	/*
> +	 * receive_cb is only used by the sync send path; leave it set so a
> +	 * late response cannot find a NULL callback.
> +	 */
> +	priv->client.receive_cb = fcs_atf_version_callback;
> +
> +	ret = stratix10_svc_send(priv->chan, msg);
> +	if (ret) {
> +		pr_err("failed to send message to service channel\n");

Try not to mix dev_err and pr_err. You should be using dev_err here. 
Same comment for all the pr_err() and pr_debug().
<snip>


> diff --git a/include/linux/firmware/intel/socfpga-fcs.h b/include/linux/firmware/intel/socfpga-fcs.h
> new file mode 100644
> index 000000000000..9a047056b280
> --- /dev/null
> +++ b/include/linux/firmware/intel/socfpga-fcs.h
> @@ -0,0 +1,122 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 Altera Corporation
> + *
> + * SDOS-only subset of the SoCFPGA FCS (FPGA Crypto Service) interface,
> + * shared between the driver front-end (socfpga-fcs.c) and the command
> + * engine (socfpga-fcs-core.c).
> + *
> + * The command engine deals in kernel pointers only: front-ends own every
> + * transfer to and from user space. In-kernel consumers can therefore drive
> + * the same engine directly.
> + */
> +#ifndef __SOCFPGA_FCS_H
> +#define __SOCFPGA_FCS_H
> +
> +#include <linux/completion.h>
> +#include <linux/device.h>
> +#include <linux/kref.h>
> +#include <linux/miscdevice.h>
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +#include <linux/firmware/intel/stratix10-svc-client.h>

You shouldn't need all of these includes.

> +
> +#define SDOS_HEADER_SZ		40
> +#define SDOS_HMAC_SZ		48
> +#define SDOS_PLAINDATA_MIN_SZ	32
> +#define SDOS_PLAINDATA_MAX_SZ	32672
> +#define SDOS_DECRYPTED_MIN_SZ	(SDOS_PLAINDATA_MIN_SZ + SDOS_HEADER_SZ)
> +#define SDOS_DECRYPTED_MAX_SZ	(SDOS_PLAINDATA_MAX_SZ + SDOS_HEADER_SZ)
> +#define SDOS_ENCRYPTED_MIN_SZ	(SDOS_PLAINDATA_MIN_SZ + SDOS_HEADER_SZ + SDOS_HMAC_SZ)
> +#define SDOS_ENCRYPTED_MAX_SZ	(SDOS_PLAINDATA_MAX_SZ + SDOS_HEADER_SZ + SDOS_HMAC_SZ)
> +
> +/**
> + * struct fcs_sdos_req - parameters for one SDOS encrypt/decrypt operation
> + * @op_mode: non-zero to encrypt, zero to decrypt
> + * @src: input buffer, any kernel address
> + * @src_len: number of valid bytes in @src
> + * @dst: output buffer, any kernel address
> + * @dst_len: on entry the capacity of @dst, on return the number of bytes the
> + *           SDM produced
> + * @status: SDM mailbox status, valid only when @status_valid is set
> + * @status_valid: set by the engine once the mailbox transaction completed,
> + *                whether it succeeded or reported a firmware error. Clear
> + *                after a transport failure, where no firmware status exists.
> + *
> + * Every pointer is a kernel address, so the engine never touches user memory.
> + */
> +struct fcs_sdos_req {
> +	u32		op_mode;
> +	const void	*src;
> +	u32		src_len;
> +	void		*dst;
> +	u32		dst_len;
> +	s32		status;
> +	bool		status_valid;
> +};
> +
> +/**
> + * Private driver state for the SoCFPGA FCS that holds the SDM/ATF service
> + * channel, the lock serialising command submission, and the latest mailbox
> + * status/response.
> + */
> +struct socfpga_fcs_priv {
> +	/* Communication channel */
> +	struct stratix10_svc_chan *chan;
> +	struct stratix10_svc_client client;
> +	struct miscdevice miscdev;
> +	/*
> +	 * Held by the driver and by every open file. An fd may outlive driver
> +	 * detach, so this state is not devm-managed: the firmware channel and
> +	 * the allocation are released only when the last reference goes.
> +	 */
> +	struct kref refcount;
> +	/* Set on remove(); further operations fail with -ENODEV. */
> +	bool removed;
> +	struct completion completion;
> +	/*
> +	 * Serializes FCS command submission: guards the session state and the
> +	 * single in-flight mailbox transaction (completion/status/resp) so only
> +	 * one SDM request is outstanding at a time. It also covers the whole
> +	 * lifetime of the service-layer pool buffers, so they cannot outlive
> +	 * @chan; user-space copying happens outside it.
> +	 */
> +	struct mutex lock;
> +	int status;
> +	u32 resp;
> +	u32 session_id;
> +	/* non-zero while a crypto context is active */
> +	u32 context_id;
> +	u32 atf_version[3];
> +	bool atf_version_valid;
> +};
> +
> +enum fcs_command_code {
> +	FCS_DEV_CRYPTO_OPEN_SESSION,
> +	FCS_DEV_CRYPTO_CLOSE_SESSION,
> +	FCS_DEV_SDOS_DATA_EXT,
> +	FCS_DEV_ATF_VERSION,
> +};
> +
> +int fcs_sdos_output_size(u32 op_mode, u32 src_len, u32 *out_len);
> +
> +/*
> + * Allocate the per-device FCS state and set up the service channel; reads the
> + * ATF version. The state is reference counted; release the driver's reference
> + * with fcs_put(). Returns an ERR_PTR on failure.
> + */
> +struct socfpga_fcs_priv *fcs_init(struct device *dev);
> +
> +/* Take/drop a reference; the last put closes the session and frees the state. */
> +void fcs_get(struct socfpga_fcs_priv *priv);
> +void fcs_put(struct socfpga_fcs_priv *priv);
> +
> +/* Refuse further operations with -ENODEV; call from the remove path. */
> +void fcs_mark_removed(struct socfpga_fcs_priv *priv);
> +
> +int fcs_get_atf_version(struct socfpga_fcs_priv *priv, u32 *version);
> +
> +/* Perform an SDOS (Secure Data Object Service) encrypt/decrypt operation. */
> +int fcs_sdos_crypt(struct socfpga_fcs_priv *priv, struct fcs_sdos_req *req);
> +
> +#endif /* SOCFPGA_FCS_H */
> diff --git a/include/uapi/misc/socfpga-fcs-crypto.h b/include/uapi/misc/socfpga-fcs-crypto.h
> new file mode 100644
> index 000000000000..6dc0ca9ebded
> --- /dev/null
> +++ b/include/uapi/misc/socfpga-fcs-crypto.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> +/*
> + * Description:
> + * This driver is developed for the SDM SoCFPGA Crypto Service (FCS). It
> + * provides an ioctl interface for the SDOS (Secure Data Object Service)
> + * encrypt/decrypt operation. The crypto session and the per-request context
> + * ID are managed by the kernel internally, so neither is part of the user
> + * ABI.
> + */
> +#ifndef __SOCFPGA_FCS_CRYPTO_H
> +#define __SOCFPGA_FCS_CRYPTO_H
> +
> +#include <linux/types.h>
> +#include <linux/ioctl.h>

Also don't need these.

Dinh
